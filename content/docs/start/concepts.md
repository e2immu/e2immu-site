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

* _container_: a type which does not make modifications to the parameters of its methods. You can use it as safe storage for your objects.

* _level 1 immutable_: all fields are effectively final (either explicitly, or only modified during the construction phase).

* field of _implicitly immutable type_: when its type can be replaced by `Object`. The best example are fields of unbound parameter type &lt;T&gt;.

* _independence_: a modification on one object has no effect on the other object.

* _level 2 immutable_: when the following four criteria are met:

    1. the type is _level 1 immutable_;
    2. the fields are not modified;
    3. the fields are either private, level 2 immutable, or of implicitly immutable type;
    4. constructor parameters are independent of the fields, as are the return values of non-private methods

* _eventually immutable_: immutability (level 1 or 2) is achieved after a field changes from a _before_ state into an _after_ or _final_ state. This blocks a number of modifying methods, which makes the type _effectively_ immutable.