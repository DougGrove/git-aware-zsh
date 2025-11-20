LAST_GIT_PATH=""

find_git_branch() {
  local branch
  local CURRENT_PATH

  CURRENT_PATH="$(pwd)"

  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then

    if [ "$CURRENT_PATH" != "$LAST_GIT_PATH" ]; then
      (git remote update >/dev/null 2>&1 &)
    fi
    LAST_GIT_PATH="$CURRENT_PATH"

    if [[ "$branch" == "HEAD" ]]; then
      branch='detached*'
    fi
    git_branch="⎇ ($branch)"
  else
    git_branch=""
  fi
}

find_git_dirty() {
  local _status
  _status="$(git status 2> /dev/null)"

  git_dirty=""

  if [[ "$_status" =~ "Not a git repository" ]]; then
    return
  fi

  if [[ "$_status" =~ "Untracked files" ]]; then
    git_dirty+="✴️ "
  elif [[ "$_status" =~ "Changes not staged for commit" ]]; then
    git_dirty+="✴️ "
  fi

  if [[ "$_status" =~ "Your branch is ahead of" ]]; then
    git_dirty+="⬆️ "
  fi

  if [[ "$_status" =~ "Your branch is behind" ]]; then
    git_dirty+="⬇️ "
  fi

  if [[ "$_status" =~ "Changes to be committed" ]]; then
    git_dirty+="➡️ "
  fi

  if [[ "$_status" =~ "have diverged" ]]; then
    git_dirty+="🔀"
  fi

  if [[ "$_status" =~ "Your branch is up to date with" ]]; then
    if [[ "$git_dirty" == "" ]]; then
      git_dirty+="✅"
    fi
  fi

}

## changed to support zsh, orginal bash line below
#PROMPT_COMMAND="find_git_branch; find_git_dirty; $PROMPT_COMMAND"
if [[ -n "$ZSH_NAME" ]]; then
  setopt PROMPT_SUBST
  autoload add-zsh-hook
  add-zsh-hook precmd find_git_branch
  add-zsh-hook precmd find_git_dirty
  # moved this to RPROMPT
  # export PROMPT="%{$bldcyn%}%n@%m%{$txtrst%}:%{$txtgrn%}%~%{$bldpur%}\$git_branch%{$txtrst$txtylw%}\$git_dirty%{$txtrst%}$ "
  export RPROMPT="%F{white}\$git_branch%{$txtrst$txtylw%}\$git_dirty%{$txtrst%}"
fi

