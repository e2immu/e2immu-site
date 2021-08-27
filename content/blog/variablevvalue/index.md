---
title: "Variable versus value"
description: "When to use a variable's value, and when to stay at variable level"
lead: "When to use a variable's value, and when to stay at variable level"
date: 2021-07-07T00:00:00+01:00
lastmod: 2021-07-07T00:00:00+01:00
draft: false
weight: 51
contributors: ["Bart Naudts"]
---

Sometimes I make intuitive decisions, which turn out to have a large impact on further development. By nature, these decisions are not well documented! So when I get stuck a couple of months later, I start questioning why this decision was made, cannot find a good reason, try to undo it, get stuck, and then, seeing both approaches in new light, can finally make a decision on whether the intuition was good or not.

This approach was taken when I decided to make local copies of variables for variable fields and variables in loops. Why didn't I simply keep the same variable, but changed value? 

## Introduction to the problem

When a variable has a known, final value, it pays to replace the variable everywhere with its value.
In this way, a lot of simple errors can be caught.

Some variables cannot have a known, final value. The simplest example are parameters, which almost by definition don't have one.
Internally, there is one value that represents "it has a value but I don't know what it is": a `NewObject` without constructor.

The problem arises when we need to distinguish between different "unknown values": in the situation of values of a variable field, and values of variables defined outside a loop, but assigned inside this loop.


## Competing approaches

The two competing approaches are

1. Use local copies of variables, each with an 'anonymous' value of `NewObject`.
1. Use a single variable, but separate values (different instances of `NewObject`, with proper identification)

## Decision

The disadvantage of approach #2 turns out to be that computing linked variables becomes a nightmare: there's no possibility of computing it on the value anymore, because this value doesn't link at all. They would have to be computed on equivalence sets rather than single variables.