
---
title: "Contributing"
description: "Contibuting to e2immu"
lead: "Contributing to e2immu"
date: 2020-10-13T15:21:01+02:00
lastmod: 2020-10-13T15:21:01+02:00
draft: false
images: []
menu:
  docs:
    parent: "prologue"
weight: 120
toc: true
---

## Project Governance

The e2immu project is sponsored by IBTECH BV, a limited liability company under Belgian law. The project welcomes
contributions from the community.

### Goal

IBTECH aims for the e2immu analyser to become a solid, dependable tool in promoting and enforcing immutability
constraints in recent versions of Java. Until this goal is reached, it will try to avoid widening the scope of the
analyser in the direction of, for example, a general code analyser, or the ability to analyser other programming
languages.

### Contributions

All contributors are expected to sign a [Contributor License Agreement](http://) (CLA) that protects their intellectual
property rights, and at the same time gives IBTECH the legal means to manage the project.

The CLA contains a provision that prevents IBTECH from making the license more restrictive. It does allow IBTECH to make
the license more permissive (e.g. from LGPLv3 to Apache License v2).

Git and Github will be used to track individual contributions.

## Covenant

The project will be managed by IBTECH and community project leads according the professional and civil collaboration
rules described in the [Contributor Covenant](https://www.contributor-covenant.org/version/2/0/code_of_conduct/).

## How to contribute

Once you have agreed to the CLA, there are many parts of the analyser ecosystem where you can make valuable
contributions, according to your specialisation, interests or capabilities.

Always use issues to attach a merge request, and try to be as concise as possible in defining issues.

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

## Coding Guidelines

Contributions are expected to follow the coding guidelines promoted by the e2immu project itself as described in
the [Road to Immutability](/docs/road-to-immutability/000-main.html). This includes:

- making use of immutable or eventually immutable types as much as possible
- avoiding types that cannot be marked `@Container`

Code formatting follows the default rules of the IntelliJ IDEA. IntelliJ's green tick box is mandatory.
