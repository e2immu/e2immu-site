---
title: "Build, install, run"
description: "How to build, install, and run the e2immu analyser."
lead: "How to build, install, and run the e2immu analyser."
date: 2020-11-16T13:59:39+01:00
lastmod: 2020-11-16T13:59:39+01:00
draft: false
images: []
menu:
  docs:
    parent: "start"
weight: 140
toc: true
---

Building and installing the analyser and related projects is detailed in the [Installing e2immu →](https://www.e2immu.org/docs/manual.html#installing) section of the manual.

### TL;DR

STEP 1: clone the project(s) from GitHub, minimally [e2immu-support →](https://github.com/e2immu/e2immu-support) and [e2immu →](https://github.com/e2immu/e2immu)

STEP 2: Use the Gradle wrapper and a Java JDK 16 to build and publish the jars to your local repository
```
./gradlew publishToMavenLocal
```

Now the support jar, analyser, two helper jars, and the Gradle plugin are available in your local repo.

STEP 3: Add the following snippet to the `settings.gradle` file of your project
```
pluginManagement {
    repositories {
        mavenLocal()
        ...
    }
    resolutionStrategy {
        eachPlugin {
            if (requested.id.namespace == 'org.e2immu') {
                useModule('org.e2immu:gradle-plugin:0.2.0')
            }
        }
    }
}
```

and these two snippets to the `build.gradle` file:
```
plugins {
    id 'java'
    ...
    id 'org.e2immu.analyser'
}

e2immu {
    debug = "OUTPUT" //INSPECT,BYTECODE_INSPECTOR,ANALYSER,DELAYED"
    jmods = 'java.base.jmod,java.logging.jmod'
    sourcePackages = "your.project.package." 
    readAnnotatedAPIPackages = "your.project.package.aapi."
    writeAnnotationXML = true
    writeAnnotationXMLPackages = "your.project.package."
    upload = true
}
```

Run the analyser on your project's code by executing
```
./gradlew e2immu-analyser
```
