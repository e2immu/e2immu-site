---
title: "Introducing e2immu"
description: "Introducing e2immu, a static code analyser for Java focusing on modification and immutability"
lead: "Introducing e2immu, a static code analyser for Java focusing on modification and immutability."
date: 2021-04-01T09:19:42+01:00
lastmod: 2021-04-01T09:19:42+01:00
draft: false
weight: 50
#images: ["say-hello-to-doks.png"]
contributors: ["Bart Naudts"]
---

Hello there! After 16 months of near full-time development, I'm proud to announce that _e2immu_ is now public on GitHub as an open source project.

_e2immu_ is a static code analyser for Java. There's a few analysers around already, but this one focuses strongly on _modification_ and _immutability_: determining when and where the data of an object gets modified, and ensuring that, after some initialisation phase, the content of certain objects can never be changed again.

Immutability is an important tool for large software projects. It helps compartimentalisation: 


I'm releasing the software _before_ the analyser is fully operational. Why? Because making a static code analyser, stable and augmented with all necessary surrounding plugins and documentation, is _a lot_ of work. 
I can do with some help!

All the concepts for effective and eventual immutability are stable and sound.
There should be sufficient documentation and examples for you to understand what I want to achieve with this analyser: helping .

The analyser's design is stable, and it is able to chew over 250 code snippets.

With your help, we can make a first generally usable version of this new static code analyser available by the end of 2021!
