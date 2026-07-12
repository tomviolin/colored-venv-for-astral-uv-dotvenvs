# Colored venv prompts for Astral `uv`

# Quick description
Intended for users of astral `uv`, this is a script to be pasted into a Linux user's `.bash_aliases` . It provides a dynamic colored prompt prefix indicating what .venv virtual environment is active, and to automatically activate the .venv virtual environment with PROMPT_COMMAND.

## Introduction
I developed this script for my own private use, to help me keep mulipile Python virtual environments, or <b>venv</b>'s, organized and managable.

Previously, I had been using Python's `venv` module to create and maintain my Python virtual envirments.  This was all well and good, but there were certain annoyances which made the default organizational structure -- or should I say lack of much structure at all -- increasingly sub-optimal:

1. You can put <b>venv</b> directories wherever you want.  This is quite freeing if you are used to the completely regimented `conda` [^1] environment.[^2]

2. 
3. 
4. 


[^1]: or it's C++-written mini-me, micromamba
[^2]:  With `conda`/`micromamba` of course, all <b>venv</b>'s are restricted to only be kept within the `anaconda` / `micromamba` directory, in a flat structure. When you are working on multiple projects, it becomes difficult to match up the project files in the normaal project folder to the correct `conda`/`micromamba` repo that  you have been using.

```bash

```
