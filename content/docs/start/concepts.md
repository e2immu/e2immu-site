---
title: "Concepts"
description: "e2immu concepts."
lead: "e2immu concepts"
date: 2020-11-16T13:59:39+01:00
lastmod: 2020-11-16T13:59:39+01:00
draft: false
images: []
menu:
  docs:
    parent: "start"
weight: 110
toc: true
---

The best place to start reading about the  immutability concepts is:

* [The Road to Immutability →](/docs/road-to-immutability.html), [PDF](/docs/road-to-immutability.pdf)

There's also a [slide deck](/powerpoint/SlideDeck1.pptx) covering the basic concepts.


TL;DR

* _modification_: changes to the object graph of an object's fields.

* _container_: a type which does not make modifications to the parameters of its constructors and non-private methods. You can use it as safe storage for your objects.

* _level 1 immutable_: all fields are effectively final (either explicitly, or only modified during the construction phase). Java `record` types are a nice example.

* field of _implicitly immutable type_: when its type can be replaced by `Object`. The best example are fields of unbound parameter type &lt;T&gt;.

* _independence_: a modification to one object has no effect on the other object. Fields of implicitly immutable type cannot be dependent, because the type has no means of modifying them.

* a type is _level 2 immutable_ when the following four criteria are met:

    1. the type is _level 1 immutable_;
    2. its fields are not modified;
    3. its fields are either private, level 2 immutable, or of implicitly immutable type;
    4. constructor parameters are independent of the fields, as are the return values of non-private methods

* _eventually immutable_: immutability (level 1 or 2) is achieved after a field changes from a _before_ state into an _after_ or _final_ state.
This blocks a number of modifying methods, which makes the type _effectively_ immutable.

Deeply immutable types (like `Object`, `String`) are of course level 2 immutable. 
But unmodifiable variants of collection classes, such as the result of `Set.of()` and `List.copyOf()`, are level 2 immutable as well.

The project proposes simple support classes such as `SetOnce` and `EventuallyFinal` that help propagate eventual immutability throughout your program.