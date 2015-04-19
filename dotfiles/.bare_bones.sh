alias reshell='source ~/.bash_profile'

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

function gph() {
  BRANCH=$(git symbolic-ref HEAD)

  MASTER="refs/heads/master"
  echo "Trying to Push Branch"
  echo "Checking if on master..."
  if  [[ "$BRANCH" == "$MASTER" ]]; then
    echo 'YOU ARE ON MASTER BRACNH!'
  else
    echo "Passed check"
    git push origin HEAD
  fi
}

function graft(){ #Git pull origin on current branch
  BRANCH=$(git symbolic-ref HEAD)
  echo ""
  echo "Pulling Down Origin Branch"
  echo "git pull origin $BRANCH"
  echo ""
  git pull origin $BRANCH
  echo ""
}

alias rr='rake routes'
alias test='bundle exec rspec spec --format documentation'
alias t='bundle exec rspec spec --format documentation'

alias rc='rails c'
alias rs='rails s'
