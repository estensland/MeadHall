function is_git_repository {
  git branch > /dev/null 2>&1
}

function set_git_state {
  git_status="$(git status 2> /dev/null)"

  if [[ ${git_status} =~ "working tree clean" ]]; then
    GIT_STATE_COLOR='green'
  elif [[ ${git_status} =~ "Changes to be committed" ]]; then
    if [[ ${git_status} =~ "Changes not staged" ]]; then
      GIT_STATE_COLOR='orange'
    else
      GIT_STATE_COLOR='yellow'
    fi
  else
    GIT_STATE_COLOR='red'
  fi
}


function git_color {
  git_status="$(git status 2> /dev/null)"

  if [[ ${git_status} =~ "working tree clean" ]]; then
    GIT_STATE_COLOR='green'
  elif [[ ${git_status} =~ "Changes to be committed" ]]; then
    if [[ ${git_status} =~ "Changes not staged" ]]; then
      GIT_STATE_COLOR='#FFA500'
    else
      GIT_STATE_COLOR='yellow'
    fi
  else
    GIT_STATE_COLOR='red'
  fi

  echo $GIT_STATE_COLOR

  return $GIT_STATE_COLOR
}

function git_branch_name {
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')

  if [[ $branch == "" ]];
  then
    :
  else
    echo '('$branch')'
  fi
}

# Enable substitution in the prompt.
setopt PROMPT_SUBST

function set_bash_prompt () {
  PROMPT='%F{red}Botros: %F{white}%T %F{cyan} $(pwd) %F{$(git_color)}$(git_branch_name) %F{#FFA500}⌘%F{reset} '
}

set_bash_prompt
