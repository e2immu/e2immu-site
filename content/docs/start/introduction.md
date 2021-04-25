---
title: "Introduction"
description: "e2immu is a static code analyser for Java"
lead: "e2immu is a static code analyser for Java, focusing on practical immutability."
date: 2020-10-06T08:48:57+00:00
lastmod: 2020-10-06T08:48:57+00:00
draft: false
images: []
menu:
  docs:
    parent: "start"
weight: 100
toc: true
---

## Welcome

Welcome to the _e2immu_ documentation.

We recommend [The Road to Immutability →](/docs/road-to-immutability.html) as a first introduction to the project. This document is also available as PDF in the [Concepts →]({{< relref "concepts" >}}) section.

All downloads (sources, jars) can be found on _e2immu_'s [GitHub page →](https://github.com/e2immu).


The _e2immu_ project tries to be two things at the same time:

* it aspires to be **educational**: large software projects are easier to maintain when code is highly compartimentalised. Knowing where modifications to objects take place is crucial. _e2immu_ introduces simple concepts such as _containers_, _eventually immutable_, and _effectively immutable_ classes to help you manage modification better.

* it provides a **static code analyser** to help you enforce the use of these concepts in your code base.
Obviously, its implementation tries to follow all the recommendations!


## Timeline

**The _e2immu_ analyser is not ready yet**. While all concepts are stable, the analyser is not robust enough yet to be applied in production settings.

The following schedule may prove to be realistic:

* 1st May 2021: open source release
* 1st August 2021: alpha release, one IDE plugin working
* 1st November 2021: beta release, one IDE plugin working, can analyse most of its own code
* 1st January 2022: version 1.0.0

## Contibuting

Please consider contribute to this open source project. You can make valuable
contributions, according to your specialisation, interests and capabilities.
Read more [here →]({{< relref "contributing">}}).

## Sponsoring

No time to contribute, but you think this project may be worthwhile?
IBTECH BV, a limited company under Belgian law, can write invoices to improve aspects of the analyser of your choice.
Please contact [Bart Naudts](mailto:bart.naudts@e2immu.org).
