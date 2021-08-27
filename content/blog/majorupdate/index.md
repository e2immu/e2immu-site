---
title: "Updated 'Road to Immutability'"
description: "Major new iteration of the 'Road to Immutability' document"
lead: "I've just pushed a major new iteration of the 'Road to Immutability' document."
date: 2021-08-26T00:00:00+01:00
lastmod: 2021-08-26T00:00:00+01:00
draft: false
weight: 50
contributors: ["Bart Naudts"]
---

Section 11 of [The Road to Immutability](https://www.e2immu.org/docs/road-to-immutability.html), now titled 'Immutable Content', has been completely revised.
The names 'implicitly immutable content' and 'support data' have been dropped, in favour of the more prosaic modifiable and immutable content of a level 2 immutable type.
Their definitions are now more obvious.
 Section 8, 'Level 2 Immutability', has been updated
accordingly, and has been expanded to explain better how extending types
influences immutability.

The changes to the document need to be reflected in the analyser.
As for the support classes, this has been done: 5 annotations have been dropped, and the annotations of the support classes have been updated. This is now version 0.3.0, in the `development` branch.

The coming months will see me updating the analyser itself with respect to the new version of 'the Road'. 
I hope to switch to the `development` branch soon.

The original planning, of having an alpha version of _e2immu_ ready in August 2021, and a beta in November 2021, looks now like a more realistic

* alpha version: end of 2021
* beta version: mid 2022

There's been almost no interaction with other developers on this project, so I set my own deadlines :-)

