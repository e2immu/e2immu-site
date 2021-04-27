---
title: "Analyser"
description: "e2immu is a static code analyser for Java."
lead: "e2immu is a static code analyser for Java."
date: 2020-11-16T13:59:39+01:00
lastmod: 2020-11-16T13:59:39+01:00
draft: false
images: []
menu:
  docs:
    parent: "start"
weight: 120
toc: true
---

Next to promoting the use of practical immutability, the _e2immu_ project provides a static code analyser to help enforce the proper use of these immutability concepts.

The analyser is _opinionated_: it warns against a number of bad practices, such as:

* Assigning to a field outside the type of that field, is not allowed. _Why?_ We believe that modification belongs to the type itself, as per the concept of a container. This may be too strong for certain situations. However, we insist that assignments to fields cannot be made outside the field itself.

* Non-private fields must be effectively final. _Why?_ We make no distinction between the different forms of non-private-ness. This restriction is closely related to the previous one, but not quite the same.

* Methods which do not refer to the instance, must be marked `static`. This is a trivial one, just make sure your IDE does it for you. 

* Parameters should not be assigned to. 

The analyser assumes that exceptions are used to detect illegal situations in the code: they should never be part of the normal program flow.
It makes no distinction between static fields and instance fields for most concepts; the assumption being that non-immutable static fields are rarely used.

The analyser does not only study modification and immutability. It also 

* does null-pointer analysis
* computes preconditions
* tracks instance state of collection objects (like when a set is empty, or not)
* checks for dead code, useless assignments, trivial conditions, etc.
* detects fluent methods, identity methods
* detects singleton classes, utility classes, and extension classes
* enforces finalizer methods

The [Manual →](/docs/manual.html) is the right place to discover what the analyser can do.

