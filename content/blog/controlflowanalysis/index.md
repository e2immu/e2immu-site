---
title: "Control flow analysis in e2immu"
description: "A primer to control flow analysis in e2immu"
lead: "A primer to control flow analysis in e2immu"
date: 2021-06-24T00:00:00+01:00
date: 2021-06-24T00:00:00+01:00
draft: false
weight: 52
contributors: ["Bart Naudts"]
---

_e2immu_'s representation of statements in a method block is very traditional:
after parsing the code with JavaParser, the `Resolver`'s `doBlock` method converts JavaParser's `BlockStmt` into an _e2immu_ `Block`.
This `Block` is fully resolved (all variable names and method references are fully known -- JavaParser calls this phase _symbol solving_)
 and now available in the `MethodInspection`. The conversion code resides in `ExpressionContext` and its helper classes, such as `ParseMethodCallExpr`.
_e2immu_ does not use JavaParser's symbol solving, for the simple reason that I wanted to learn how to do so myself.

At `Statement` level, the Java code is represented hierarchically: a `Block` is a statement, and some statements like `IfElseStatement` have
one or two sub-blocks. The condition in the latter is an `Expression`, as expected.
 Two points are worth mentioning. First, all statements and expressions are (level 2) immutable. At the end of the resolution phase, the
 `MethodInspectionImpl.Builder` builds an immutable `MethodInspection` implementation, in effect 'sealing' the result of parsing the Java code.
 Second, each statement has its components stored in a more abstract `Structure` object, which allows the analyser to deal with statements in a 
 slightly more abstract way.

At the heart of control flow analysis is the `StatementAnalyser`.
Each `Statement` has its corresponding `StatementAnalyser`, which is discarded at the end of the analysis phase.
However, the (eventually immutable) data in the companion `StatementAnalysis` object remains.

Analysing Java code often means gathering information from all over the primary type: for example, to know whether a field's
value can be null will depend on an analysis of all methods where the field occurs. Knowing that a field's value cannot be 
null influences the analysis of methods where that field occurs. So we expect an interplay between type analysers,
method analysers, field analysers, and control flow inside statement analysers.

To this end, _e2immu_'s analysers, and the `StatementAnalyser` in particular, make multiple passes, each time equipped
with more information about the components of the code.
Critically, once an analyser makes a decision, this decision cannot change anymore. Decisions can be _delayed_, however,
which means that an attempt to decide will be deferred to the next pass.

Decisions about the flow of statements is stored across `StatementAnalysis`'s `NavigationData`, `StateData`, and `FlowData` fields.
The first, `NavigationData`, mimicks the original Java flow as stored in the `Statement`s of the `MethodInspection`.
It allows the statement analyser to navigate the code _as is_. It also contains the single `replacement` field, which
can be used by other projects to make code replacements.

The second, `StateData`, stores the evaluation result of the current statement's expression, if available, and, equally important,
the current _condition_, _state_, _precondition_, and their cumulative counterparts.
The condition is the boolean expression containing all conditions that had to be met to reach this statement in the flow of the method.
The state is the boolean expression of knowledge of values caused by conditions and interrupts. It is either local or cumulative.
In the following code, state and condition have been annotated:
```java
 public static int method1(boolean a, boolean b) {
        if (a && b) {
            return 1; // condition: a && b; no state; cumulative: a && b
        }
        // no condition, the (cumulative) state is now !(a && b)
        if (!a && !b) {  
            return 2;  // condition and cumulative state: !a && !b
        }
        // state is now: !(a && b) && (!a && !b) === (a || b) && (!a || !b)
        if (a && !b) return 3;
        // state: !a && b
        if (!a && b) return 4; // ERROR: conditional evaluates to constant
        // state: false
        int c = 0; // ERROR: unreachable statement
        return 5;//  unreachable statement, but no error anymore
    }
```
Preconditions are essentially states and conditions caused by 'escapes': we view exceptions as being outside of the normal control flow.

The results of control flow analysis are stored in `FlowData`:

* `guaranteedToBeReachedInCurrentBlock`: a boolean (as always, wrapped in `SetOnce` to ensure that decisions cannot be overwritten)
* `guaranteedToBeReachedInMethod`: a boolean
* `blockExecution`: one of `ALWAYS`, `CONDITIONAL`, `NEVER`, or `DELAYED`
* `interruptsFlow`: are there any interrupts such as a `return` statement, a `break` or `continue`, or an exception which is thrown?

Together, these decisions allow the statement analyser to return the `lastStatement()` of a block -- this is the statement where
each of the variables have their final value. When it differs from the `NavigationData`, the analyser has performed dead code analysis.
They can, for example, also answer `lastStatementIsEscape()`, which is used by the method analyser to compute the return value of a method.

The sub-block analysis part of the statement analyser uses `blockExecution` to determine if there are branches of `if-else` or `switch` statements
that can never be reached, which would result in errors.
The `interruptsFlow` information is critical to determine which statements (`if-else`, `assert`) actually represent preconditions for the methods:
conditions which causes a 'fatal' exception to be thrown if they are not met.

Let's conclude this post by stating that no control flow analysis is possible without a solid boolean expression analysis.
In the example, the accumulation of boolean expressions has to be normalised, so that the state can be compared to the `if-else` statement's
condition. This obviously goes beyond boolean analysis; in particular, _e2immu_ has quite a lot of logic to evaluate and simplify expressions
containing the inline conditional `a ? b : c`. An example of such a simplification rule is
```java
 x && y ? (y && z ? a : b) : c   -->   x && y ? (z ? a : b) : c
 ```
which removes the `y` component from the inner inline conditional's condition.
Finally, note that this rule can only be applied when the expression `y` is not a modifying expression, such as `list.add(3)`!