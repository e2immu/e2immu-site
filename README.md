# e2immu/e2immu-site

The website for the e2immu project is built with `hugo`; it uses a theme called `Doks`.

## Install

Please install

* `git` from https://git-scm.com/download/win
* `npm` from https://nodejs.org/en/download/
* `hugo` from https://github.com/gohugoio/hugo/releases

On Mac (but also on Linux, and Windows Subsystem for Linux), all three can be installed with `brew`: https://brew.sh/

## Build

Run
```
npm install
npm run start
```

A local site will be available on `http://localhost:1313`.


Install a sub-module of git to create the /public folder by running
```
git submodule add -b master git@github.com:e2immu/e2immu.github.io.git public
```
