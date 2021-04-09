---
title: "Dependencies"
description: "Dependencies of e2immu"
lead: "Dependencies of e2immu"
date: 2020-10-13T15:21:01+02:00
lastmod: 2020-10-13T15:21:01+02:00
draft: false
images: []
menu:
  docs:
    parent: "help"
weight: 130
toc: true
---

The analyser primarily depends on

* [JavaParser.org](https://javaparser.org/) to parse Java source files;
* [ASM](https://asm.ow2.io/) to parse Java byte-code.

Like many other Java projects, it also uses

* [slf4j](http://www.slf4j.org/) and  [LogBack](https://logback.qos.ch/) for logging;
* [commons.io](https://commons.apache.org/proper/commons-io/) for reading and writing to files;
* [JUnit 5](https://junit.org/junit5/) for testing.

The annotation store uses

* [Vertx.io](https://vertx.io/) for configuration and HTTP communication.

Obviously, the Gradle plugin links to Gradle libraries, and the IntelliJ highlighter to Jetbrains libraries.