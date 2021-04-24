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

## Is e2immu secure?

Interpreting this as "Is my source code safe?", the answer is: Yes!

* The analyser reads your code and your jars; nothing can be done about that.
* However, the analyser runs locally, in your environment. It is not Software as a Service. You have to install it
(and currently, also build it first).
* On your request, the analyser can write out *annotationXml* and *annotatedAPI* files, to a (build) folder of your choice.
* On your request, the analyser can upload to the annotations (not the source!) to an annotation manager of your choice.
The one provided in the project, `e2immu/annotation-manager`, can play that role.
You control where it runs, if it runs.
* In debug mode, the analyser can, on your request, write out an annotated version of you source code.

The analyser is fully open source, so you can verify these claims. 
It relies on a small number of other open source projects ([dependencies →]({{<relref "dependencies">}}) and [plugins →]({{<relref "plugins">}})), which you then should verify too.

## Why the LGPL license?

It allows you to write and distribute commercial software that incorporates the analyser.
Because of LGPL, I'm hoping that everyone can benefit from your improvements to the analyser.

## Technical questions

### IllegalStateException

The following exception is one of the two more common problems in the analyser:

```
07:50:04.282 [Test worker] ERROR org.e2immu.analyser.util.EventuallyFinalExtension - Overwriting effectively value: old: nullable instance type String, new object.toString()
07:50:04.282 [Test worker] WARN org.e2immu.analyser.analyser.StatementAnalyser - Caught exception while analysing statement 3 of org.e2immu.analyser.testexample.Store_0.flexible(java.lang.Object,long)
07:50:04.282 [Test worker] WARN org.e2immu.analyser.analyser.StatementAnalyser - Caught exception while analysing block 0 of: org.e2immu.analyser.testexample.Store_0.flexible(java.lang.Object,long)
07:50:04.282 [Test worker] WARN org.e2immu.analyser.analyser.MethodAnalyser - Caught exception in method analyser: org.e2immu.analyser.testexample.Store_0.flexible(java.lang.Object,long)
07:50:04.282 [Test worker] WARN org.e2immu.analyser.parser.Parser - Caught runtime exception while analysing type org.e2immu.analyser.testexample.Store_0

Trying to overwrite final value
java.lang.IllegalStateException: Trying to overwrite final value
	at org.e2immu.support.EventuallyFinal.setFinal(EventuallyFinal.java:36)
	at org.e2immu.analyser.util.EventuallyFinalExtension.setFinalAllowEquals(EventuallyFinalExtension.java:35)
```

The exception shows that because of internal problems, the analyser violates the core rule that once a decision on a topic has been made, it can never be changed anymore. The warning lines show which part of the source code caused the problem; the error line shows the competing values.

### More than 10 iterations needed

The second common exception is the "More than 10 iterations needed" one, really the opposite of the former.
It indicates that for a certain topic, no decision was reached, and delays kept coming iteration after iteration.
The cause is typically more difficult to pinpoint, and a _delay report_ is written in logger warnings.

```
java.lang.UnsupportedOperationException: More than 10 iterations needed for primary type org.e2immu.kvstore.Store?
        at org.e2immu.analyser.analyser.PrimaryTypeAnalyser.analyse(PrimaryTypeAnalyser.java:203)
        at org.e2immu.analyser.parser.Parser.analyseSortedType(Parser.java:191)
```


