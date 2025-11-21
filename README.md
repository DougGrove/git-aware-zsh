# Git Aware Prompt

Working with Git and its great branching/merging features is amazing. Constantly switching branches can be confusing though as you have to run `git status` to see which branch you're currently on.

The solution to this is to have your terminal prompt display the current branch and repo status. There's a number of articals online for bash or zsh about how to achieve this. This project is an attempt to make an easy to install/configure solution for zsh.


## Overview

If you `cd` to a Git working directory, you will see the current Git branch name displayed in your terminal prompt along with any uncommoited changes locally and upstream. When you're not in a Git working directory, your prompt works like normal.

<img width="911" height="365" alt="image" src="https://github.com/user-attachments/assets/f9b8886b-472e-47ae-bacd-71931ad8d319" />


## Installation

Clone the project to a `git` folder in your home directory:

```bash
mkdir ~/git
cd ~/git
git clone https://github.com/DougGrove/git-aware-zsh.git
```

Edit your `~/.zshrc` and add the following:

```bash
export GITAWAREPROMPT=~/git/git-aware-zsh
source "${GITAWAREPROMPT}/main.sh"
```


## Configuring

Once installed, there will be new `$git_branch` and `$git_dirty` variables available to use in the `PS1`, `PROMPT`, or `RPROMPT` environment variable, along with a number of color helper variables which you can see a list of in [colors.sh][].

[colors.sh]: https://github.com/DougGrove/git-aware-zsh/blob/master/colors.sh

If you want to know more about how to customize your prompt, I recommend this article: [Zsh Prompts that don't suck][5] or [Moving to zsh, part 6 – Customizing the zsh Prompt][6]. 

[5]: https://sureshjoshi.com/development/zsh-prompts-that-dont-suck
[6]: https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/


### Suggested Prompts

By default this uses `RPROMPT`, but if you like you can use `$find_git_branch` and `$find_git_dirty` in your `PS1` or `PROMPT`.


## Updating

Assuming you followed the default installation instructions and cloned this
repo to `~/git/git-aware-zsh`:

```bash
cd ~/.bash/git-aware-zsh
git pull
```

## License

[CC0 1.0 Universal](http://creativecommons.org/publicdomain/zero/1.0/)
