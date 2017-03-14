---
title: Keeping Track Of Cosmetic Configuration Changes
layout: post
tags: [code]
---

One of the minor regrets that I've had over the years is not keeping adequate track of configuration changes--even cosmetic changes.

At work, I recently got a new MacBook Pro, and in the process of migrating over to it, I reverse-engineered the bits and pieces of my `.bash_profile` that (with other things) create a beautiful output:

* [Solarized Dark color theme](https://github.com/altercation/solarized)

* Git indicators for branch, new files, newly-staged files, and files ready to commit (thanks to [vcprompt](https://github.com/djl/vcprompt)).

* A virtual environment indicator.

<img src="https://raw.github.com/jackmaney/bash-profile/master/screenshot.png" width="800" height="500">

The only other piece--the bits of `.bash_profile` that put the rest of these things together--can be found [here](https://github.com/jackmaney/bash-profile).
