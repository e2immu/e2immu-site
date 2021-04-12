---
title: "FAQ"
description: "Answers to frequently asked or important questions."
lead: "Answers to frequently asked or important questions."
date: 2020-10-06T08:49:31+00:00
lastmod: 2020-10-06T08:49:31+00:00
draft: false
images: []
menu:
  docs:
    parent: "help"
weight: 630
toc: true
---

## What is e2immu?

_e2immu_ is a static code analyser for modern Java. It aims to help you write better code by
making you aware of unwanted constructs, possible causes for exceptions etc. Even if it includes many "standard"
warnings, _e2immu_ is not a general code analyser:
it focuses on modification and immutability. It is able to detect that classes are immutable in practice, or not, and
why they are not.

It also provides a practical definition of such immutability, called "effective immutability". It can detect that
classes are _eventually_ immutable, i.e., they become effectively immutable after an initialisation phase. It provides
some out-of-the-box classes that help with making your own code eventually immutable.

Ideally, the results of the analyser are shown directly in your programming environment. At the moment, a plugin for
IntelliJ is in development. Support for Eclipse and Visual Studio Code are planned.

## Why the LGPL license?

It allows you to write and distribute commercial software that incorporates the analyser.
Because of LGPL, I'm hoping that everyone can benefit from your improvements to the analyser.

## Technical questions
