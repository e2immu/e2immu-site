---
title: "LAST_READ edges for an AST graph"
description: "How to add LAST_READ edges to the AST graph, using symbol-solved JavaParser or e2immu?"
lead: "How to add LAST_READ edges to the AST graph, using symbol-solved JavaParser or e2immu?"
date: 2021-07-01T00:00:00+01:00
date: 2021-07-01T00:00:00+01:00
draft: false
weight: 53
contributors: ["Bart Naudts"]
---

Question: How can I add `LAST_READ` edges to an abstract syntax tree (AST)? `LAST_READ` connects a node representing a usage of a variable to all nodes in the AST at which that variable’s value could have been last read from memory.

I will try to answer this question at the level of variables read in the different statements of a method, rather than at level of fields accessed in different methods.

## Answer 1, using JavaParser’s symbol-solved AST or _e2immu_’s Inspection

The basic data structure that you want to work towards is a `Variables` object that keeps track of which variables are in use for every statement in the method. Each entry in the AST gets a `Variables` object; inside is a  “AST variable symbol -> `Variable`" map.
For each `Variable`, you can then record whether it was read or assigned in this statement. Traversing the AST will then allow you to add the `LAST_READ` edges by grabbing the data from the `Variables` object.

In the simplest form, you only keep track of creation, read and write events: a variable which is not read, written or created will not be present in the statement’s `Variables` map. This is sufficient to build the `LAST_READ` edges,
but it may not be very convenient for a more in-depth analysis, because it'll require a lot of searching and jumping around in the AST.

One rather obvious problem with this simplistic approach is that it does not keep track of indirect access: each time a variable is assigned to another variable, both need to be followed to track access to the underlying object, as shown in the following rather trivial example:
```java
public static int length(String s) {
    String t = s;
    return t.length();
}
```
The `LAST_READ` will therefore be correct at variable level, rather than at object level.

## Answer 2, using _e2immu_’s Analysis data

_e2immu_ keeps track of every variable accessible (non-fields) or used up to now (fields), in every statement. Information is stored in an incremental way, so that the full state is always available without having to refer to earlier statements. 

The main data structure is the map `StamenteAnalysis.variables`, which associates the variable’s FQN with a container which holds the variable’s state.
This `VariableInfoContainer` keeps track of initial state (before evaluation of the main expression), evaluation state, and merged state (after summarizing changes to the variable in the sub-blocks).
Each of the (up to) 3 `VariableInfo` state objects contains, among others, last read, last written, and current value information.

To build the `LAST_READ` edges, it therefore suffices to traverse the `StatementAnalyser` hierarchy (see previous post), loop over the variables in each statement, and keep track of READ events.

When traversing, a fair number of artificially generated variables will need to be discarded: _e2immu_ generates, among others, “read copies” of variable fields (because their value may be different each time it gets read), “loop copies” of local variable defined outside a loop, but used inside one (because the assignments to these variables may depend on loop variables). The `VariableNature` interface describes each local variable’s purpose. 

To keep track of the actual value of a variable, `VariableInfo` contains a set called `staticallyAssignedVariables`, which allows for the construction of an equivalence set of all variables with the same value.