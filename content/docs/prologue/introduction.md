---
title: "Introduction"
description: "e2immu is a static code analyser for Java"
lead: "e2immu is a static code analyser for Java."
date: 2020-10-06T08:48:57+00:00
lastmod: 2020-10-06T08:48:57+00:00
draft: false
images: []
menu:
  docs:
    parent: "prologue"
weight: 100
toc: true
---

## Welcome

Welcome to the _e2immu_ documentation.

We recommend [The Road to Immutability →](https://www.e2immu.org/static/road-to-immutability/000-main.html) as a first introduction to the analyser. This document is also available as PDF in the [Tutorials →]({{< relref "tutorials" >}}) section.

## Timeline

_e2immu_ is not ready yet. While all concepts are stable, the analyser is not robust enough yet to be applied in production settings.

We try to adhere to the following timing:

* 1st May 2021: open source release
* 1st August 2021: alpha release
* 1st November 2021: beta release
* 1st January 2022: version 1.0.0

## Contibuting

Please consider contribute to this open source project. You can make valuable
contributions, according to your specialisation, interests or capabilities:

### Bug reports, minor fixes, and test examples

Especially now in the early phase, this area offers rich pickings, as the analyser is not that stable yet. Make sure
you're testing against the latest version of the analyser.

It is important to write test examples that are as concise as possible.

### Library annotations

The topic of library annotations can be worked on indefinitely. Once the analyser is sufficiently stable, it can propose
an annotated API, which can then be improved manually.

### User interfaces

This topic can generally be split into two important aspects: design, and the different implementations.

The design aspect centers around the most informative and least intrusive way of conveying the analyser's information.

Implementations focus on the different IDEs, and the infrastructure necessary to run the analyser in the background.

### Documentation and tutorials

The educational aspect of the analyser is important. I'd almost say there cannot be sufficient material to promote good
software engineering practices.

Secondly, the analyser is a living piece of code, and catching up with the technical specification is a task in itself.

Translations of key documents are welcomed as well, especially to promote the immutability concepts to aspiring or
starting software developers. No one should be constrained in their programming skills by a lack of understanding of
English.

Finally, because many non-native speakers contribute in their second or third language, we welcome improved re-phrasings
in case the text deviates too much from natural language.

### The analyser core

Contributing to the analyser core is not for the faint of heart, and probably requires a decent investment in time and
effort before you can make meaningful improvements or extensions.

## Sponsoring

No time to contribute, but you think this project may be worthwhile?
IBTECH BV, a limited company under Belgian law, can write invoices to improve aspects of the analyser of your choice.
Please contact [Bart Naudts](mailto:bart.naudts@e2immu.org).
