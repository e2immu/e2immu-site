---
title: "Plugins"
description: "e2immu in your set-up"
lead: "Adapt e2immu to your set-up"
date: 2020-10-13T15:21:01+02:00
lastmod: 2020-10-13T15:21:01+02:00
draft: false
images: []
menu:
  docs:
    parent: "help"
weight: 220
toc: true
---

## Gradle plugin

The [Gradle plugin](https://github.com/e2immu/e2immu/tree/main/gradle-plugin) helps integrating the analyser in your Gradle workflow.

All details about configuring the Gradle plugin are in the manual, see [Manuals →]({{< relref "manuals" >}}).


## IntelliJ IDEA plugin

The [IntelliJ plugin](https://github.com/e2immu/e2immu-intellij-plugin) is a highlighter for the IntelliJ IDEA. It shows the immutability of classes computed by the analyser in your source code editor.

The set-up involves a helper application, the [annotation store](https://github.com/e2immu/e2immu-annotation-store).

The plugin's operation is described in the manual, see [Manuals →]({{< relref "manuals" >}}).

## Plugins for other IDEs

There is no Eclipse plugin yet, nor one for any other IDE.

However, the setup with an annotation store allows collaboration between multiple developers, some who use Eclipse, some who use IntelliJ. As long as they upload their (part of) the analyser's results to the common store, they can both see each other's immutability information.  