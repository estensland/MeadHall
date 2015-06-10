# Git Aliases

# g_ Aliases

alias g='echo git & git'
alias gi='echo gi & git init'
alias ga='echo git add . & git add .'
alias gap='echo git add --all -p & git add --all -p'
alias gc='echo git commit -m & git commit -m'
alias gac='echo git add . && git commit -m & git add . && git commit -m'
alias gapc='echo git add --all -p && git commit -m & git add --all -p && git commit -m'
alias gb='echo git branch & git branch'
alias gco="echo git checkout & git checkout"
alias gs='echo git status & git status'
alias gss='echo git status -s & git status -s'
alias gd='echo git diff & git diff'
alias gdc='echo git diff --cached & git diff --cached'

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

alias ggph='echo gph && gobranch & gph && gobranch'
alias gr='echo git pull --rebase & git pull --rebase'
alias gv='echo git remote -v & git remote -v'

# Shorthands

alias choochoo='echo git push origin master --force & git push origin master --force'
alias mikedrop='echo git push origin master & git push origin master'

alias hitme='echo git pull origin master & git pull origin master'

function graft(){ #Git pull origin on current branch
  BRANCH=$(git symbolic-ref HEAD)
  echo ""
  echo "Pulling Down Origin Branch"
  echo "git pull origin $BRANCH"
  echo ""
  git pull origin $BRANCH
  echo ""
}

alias cmdz='echo git reset --soft HEAD~1 & git reset --soft HEAD~1' #undo a commit


git-help () {
  echo " Git Aliases"
  echo
  echo " g_ Aliases"
  echo
  echo " g   = git"
  echo " gi  = git init"
  echo " ga  = git add ."
  echo " gap = git add --all -p"
  echo " gc  = git commit -m"
  echo " gac = git add . && git commit -m"
  echo " gapc= git add --all -p && git commit -m"
  echo " gb  = git branch"
  echo " gco = git checkout"
  echo " gs  = git status"
  echo " gss = git status -s"
  echo " gd  = git diff"
  echo " gdc = git diff --cached"
  echo " gph = git push origin HEAD (If Not Master)"
  echo " ggph = git push origin HEAD && gobranch"
  echo " gr  = git pull --rebase"
  echo " gv  = git remote -v"
  echo
  echo " Shorthands"
  echo
  echo " mikedrop = git push origin master"
  echo " choochoo = git push origin master --force"
  echo " hitme    = git pull origin master"
  echo " graft    = git pull origin (Current Branch)"
  echo " cmdz     = git reset --soft HEAD~1"
  echo
}
