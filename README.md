# Colored venv prompts for Astral `uv` venvs

## Quick description
Intended for users of astral `uv`, this is a script to be pasted into a Linux user's `.bash_aliases` . It provides a dynamic colored prompt prefix indicating what .venv virtual environment is active, and to automatically activate the .venv virtual environment with PROMPT_COMMAND.
## Quick demo (completely non-interactive, but maybe gives you an idea)

This just shows me changing to various directories containing various projects that I work with. The three directories that have `.venv` virtual environments are  `mn`, `auther`, and `surf/holosurf`.

<img width="860" height="322" alt="image" src="https://github.com/user-attachments/assets/a2a0c035-f156-4385-a460-9c09d0814bd4" />


## THE SOLUTION: (or at least a handy tool): <b>colored-venv-for-astral-uv-dotvenvs</b>
Catchy name I know. But it is what it is for now.

Just place the code from the bash_aliases file (no leading dot on purpose [^0] ) in this repo into your existing `~/.bash_aliases` file, or create a new blank `.bash_aliases` file and place the contents of the `bash_aliases` file into it. 

## What happens?
Whenever your `bash` prompt is displayed, the script causes the shell to check if there is a `.venv` folder in the current directory, and if said directory contains the file `bin/activate`.  If so, it <b>automatically activates</b> the venv!  (It also deactivates any prior activated venv.) This activation results in an <b>immediate</b> update of the venv prompt prefix. <b>VERY COOL!</b>

## but wait, there's more
In addition, the venv prompt prefix is <b>color coded</b> as follows:
1. bright red background: The script <b>just</b> switched you to a different venv than you were in before.
2. blue text: you are currently in the directory where your activated venv is located.
3. gray: you `chdir`-ed (or `cd`-ed) into a directory where no .venv environment exists, but you still have a venv activated from a previous directory.


## Introduction
I developed this script for my own private use, to help me keep mulipile Python virtual environments, or <b>venv</b>'s, organized and managable.

### Why?
Previously, I had been using Python's `venv` module to create and maintain my Python virtual envirments.  This was all well and good, but there were certain annoyances which made the default organizational structure -- or should I say lack of much structure at all -- increasingly sub-optimal:

1. You can put <b>venv</b> directories wherever you want.
2. You can name them anything you want.
3. This results in a mess unless you adopt strict standards to your repo naming and location.
4. Yes there's `conda`[^1] but I found that _too_ restrictive.

## The answer(s)

At some point I discovered Astral's `uv` program.  It is much faster than python's native `pip` program, which is why I started using it.

## But then...

I discovered that `uv` included its own implementation of the python native `venv` module.  In addition to being fast, it has a unique ability to create a virtual python environment named `.venv` in a directory.  When that environment is activated, the prompt does NOT show `(.venv)` but it shows `(parentdir)` This makes that .venv virtual environment effectively the "default" venv for that directory.

## Now <b>THIS</b> is useful!

Now it becomes straightforward to associate a venv with a project source tree or working directory.

## One last annoyance.

After some time frequently switching from one project to the next, it became very annoying to have to continually type `. ./.venv/bin/activate` when switching projects. Not only that, but forgetting to do so could potentially lead to `venv` mismanagement when you start inavertently adding/deleting modules from the wrong venv.

# The future!
https://youtu.be/iDhy1ta6270?si=Iy4hdocMDTdIFECd&t=38
[^3]
Seriously, if anyone wants to take this idea and make a better script, or take this script and make a better idea, be my guest.



[^0]: I named it that so that someone doesn't just plop the file into their home directory and blow away their actually active .bash_aliases file (not that I've ever done that... who, me?)
[^1]:  With `conda`/`micromamba`[^2] of course, all <b>venv</b>'s are restricted to only be kept within the `anaconda` / `micromamba` directory, in a flat structure. When you are working on multiple projects, it becomes difficult to match up the project files in the normaal project folder to the correct `conda`/`micromamba` repo that  you have been using.
[^2]: or it's C++-written mini-me, micromamba
[^3]: I'm a lifelong Michael J. Fox fan.  I've got all his diseases. (Well, really just the Parkinson's, but believe me, that's enough!!)




```
 
