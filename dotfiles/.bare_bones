alias reload='source ~/.bash_profile'

alias ..='cd ..'
alias ...='cd ../..'
alias -='cd -'


alias ls='ls -G'        # Compact view, show colors

# Zeus
alias zs='zeus start'
alias zc='zeus c'
alias zss='zeus s'
alias ztm='zeus rspec'
alias zr='zeus rake'

alias rr='rake routes'

function ztc(){
  if [ $# -gt 1 ]; then
      echo testing line $2 in $1 controller
      zeus rspec spec/controllers/$1_controller_spec.rb:$2;
  else
      echo testing all of $1 controller
      zeus rspec spec/controllers/$1_controller_spec.rb;
  fi
}

function ztm(){
  if [ $# -gt 1 ]; then
      echo testing line $2 in $1 model
      zeus rspec spec/models/$1_spec.rb:$2;
  else
      echo testing all of $1 model
      zeus rspec spec/models/$1_spec.rb;
  fi
}

alias ga='git add .'
alias gap='git add --all -p'
alias gc='git commit -m'
alias gac='git add . && git commit -m'
alias gapc='git add --all -p && git commit -m'
alias gb='git branch'
alias gco="git checkout"
alias gs='git status'
alias gss='git status -s'
alias gd='git diff'
alias gdc='git diff --cached'
alias gph='git push origin HEAD'
alias gr='git pull --rebase'
alias gv='git remote -v'

alias hitme='git pull origin master'


alias rr='rake routes'
alias test='bundle exec rspec spec --format documentation'
alias t='bundle exec rspec spec --format documentation'

alias rc='rails c'
alias rs='rails s'


# GIT_PS1_SHOWDIRTYSTATE=true

RED="\[\033[1;91m\]"
YELLOW="\[\033[1;93m\]"
GREEN="\[\033[1;92m\]"
BLUE="\[\033[1;94m\]"
WHITE="\[\033[1;97m\]"
COLOR_RESET="\[\e[0m\]"

function is_git_repository {
  git branch > /dev/null 2>&1
}

function set_git_state {
  git_status="$(git status 2> /dev/null)"

  if [[ ${git_status} =~ "working directory clean" ]]; then
    GIT_STATE_COLOR="${GREEN}"
  elif [[ ${git_status} =~ "Changes to be committed" ]]; then
    GIT_STATE_COLOR="${YELLOW}"
  else
    GIT_STATE_COLOR="${RED}"
  fi

  remote_pattern="# Your branch is (.*) of"
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      GIT_REMOTE_STATE=" ↑"
    else
      GIT_REMOTE_STATE=" ↓"
    fi
  else
    GIT_REMOTE_STATE=""
  fi

  diverge_pattern="# Your branch and (.*) have diverged"
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    GIT_REMOTE_STATE=" ↕"
  fi
}

function set_bash_prompt () {
  if is_git_repository ; then
    set_git_state
  else
    GIT_STATE_COLOR="${WHITE}"
  fi

  PS1="${RED}\h:${COLOR_RESET} ${WHITE}\@${COLOR_RESET} \w\$(__git_ps1 ' ${GIT_STATE_COLOR}(%s)${GIT_REMOTE_STATE}${COLOR_RESET}') $ "
}

PROMPT_COMMAND=set_bash_prompt

# LET'S TERMINAL OPEN IN SAME DIRECTORY IN A NEW TAB

if [ "$TERM_PROGRAM" == "Apple_Terminal" ] && [ -z "$INSIDE_EMACS" ]; then
   update_terminal_cwd() {
       # Identify the directory using a "file:" scheme URL,
       # including the host name to disambiguate local vs.
       # remote connections. Percent-escape spaces.
       local SEARCH=' '
       local REPLACE='%20'
       local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
       printf '\e]7;%s\a' "$PWD_URL"
   }
   PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"
fi



