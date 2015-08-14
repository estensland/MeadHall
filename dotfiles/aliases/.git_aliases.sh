# Git Aliases

# g_ Aliases
batch_alias_create  \
"g:git" \
"gi:git init" \
"ga:git add ." \
"gap:git add -all -p" \
"gc:git commit -m" \
"gac:git add . ; git commit -m" \
"gapc:git add --all -p && git commit -m" \
"gb:git branch" \
"gco:git checkout" \
"gs:git status" \
"gss:git status -s" \
"gd:git diff" \
"gdc:git diff --cached" \
"gr:git pull --rebase" \
"gv:git remote -v" \
"ggph:gph && gobranch"

function gc() {
  echo "git commit -m"
  git commit -m $1
}

function gac() {
  echo "git add ."
  git add .
  echo "git commit -m"
  git commit -m $1
}


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

# Shorthands

batch_alias_create  \
"mikedrop:git push origin master" \
"choochoo:git push origin master --force" \
"hitme:git pull origin master" \
"cmdz:git reset --soft HEAD~1"

function graft(){ #Git pull origin on current branch
  BRANCH=$(git symbolic-ref HEAD)
  echo ""
  echo "Pulling Down Origin Branch"
  echo "git pull origin $BRANCH"
  echo ""
  git pull origin $BRANCH
  echo ""
}


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
  echo " cmdz     = git reset --soft HEAD~1"
  echo " graft    = git pull origin (Current Branch)"
  echo
}
