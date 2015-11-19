# run and tell function runs the alias, but says what the real command was

function run_and_tell(){
  echo
  echo Running: $@
  echo
  eval $@
  echo
}


# run and tell quoted inputs function runs the alias, but keeps extra arguments locked in as a string, like for git commit

function run_and_tell_quoted_inputs(){
  echo
  echo Running: $1 "'${@:2}'"
  echo
  eval $1 "'${@:2}'"
  echo
}


# Alias List: Bundler

alias b="run_and_tell bundle"
alias bi="run_and_tell bundle install --path vendor"
alias be="run_and_tell bundle exec"
alias bl="run_and_tell bundle list"
alias bu="run_and_tell bundle update"
alias bp="run_and_tell bundle package"

function bundler-help(){
  echo
  echo "Bundler Aliases"
  echo
  echo " b          = bundle"
	echo " bi         = bundle install --path vendor"
	echo " be         = bundle exec"
	echo " bl         = bundle list"
	echo " bu         = bundle update"
	echo " bp         = bundle package"
  echo
}



#########


# Alias List: DevOps



function hop(){
  echo
  echo "running: sshing..."
  echo

  echo ssh -p $1 $2@$3
  echo ''
  ssh -p $1 $2@$3;


  echo
  echo
}

function devops-help(){
  echo
  echo "Devops Aliases"
  echo
  echo " hop        = ssh -p(port, user, ip"
  echo
}



#########


# Alias List: Git

alias g="run_and_tell git"
alias gi="run_and_tell git init"
alias ga="run_and_tell git add"
alias gap="run_and_tell git add --all -p"
alias gb="run_and_tell git branch"
alias gco="run_and_tell git checkout"
alias gs="run_and_tell git status"
alias gss="run_and_tell git status -s"
alias gd="run_and_tell git diff"
alias gdc="run_and_tell git diff --cached"
alias gr="run_and_tell git pull --rebase"
alias gv="run_and_tell git remote -v"
alias ggph="run_and_tell gph && gobranch"
alias hitme="run_and_tell git pull origin master"
alias cmdz="run_and_tell git reset --soft HEAD~1"
alias gac="run_and_tell_quoted_inputs 'git add . ; git commit -m'"
alias gc="run_and_tell_quoted_inputs 'git commit -m'"


function graft(){
  echo
  echo "running: git pull origin HEAD"
  echo

  BRANCH=$(git symbolic-ref HEAD)
  echo ""
  echo "Pulling Down Origin Branch"
  echo "git pull origin $BRANCH"
  echo ""
  git pull origin $BRANCH
  echo ""

  echo
  echo
}

function git-help(){
  echo
  echo "Git Aliases"
  echo
  echo " g          = git"
	echo " gi         = git init"
	echo " ga         = git add"
	echo " gap        = git add --all -p"
	echo " gb         = git branch"
	echo " gco        = git checkout"
	echo " gs         = git status"
	echo " gss        = git status -s"
	echo " gd         = git diff"
	echo " gdc        = git diff --cached"
	echo " gr         = git pull --rebase"
	echo " gv         = git remote -v"
	echo " ggph       = gph && gobranch"
	echo " hitme      = git pull origin master"
	echo " cmdz       = git reset --soft HEAD~1"
	echo " gac        = git add . ; git commit -m"
	echo " gc         = git commit -m"
	echo " graft      = git pull on current branch"
  echo
}



#########


# Alias List: Heroku

alias hl="run_and_tell heroku list"
alias hi="run_and_tell heroku info"
alias ho="run_and_tell heroku open"
alias hr="run_and_tell heroku rake"
alias hcon="run_and_tell heroku console"
alias hnew="run_and_tell heroku create"
alias hrestart="run_and_tell heroku restart"
alias hlog="run_and_tell heroku logs"
alias hc="run_and_tell heroku config"
alias hca="run_and_tell heroku config:add"
alias hcr="run_and_tell heroku config:remove"
alias hcc="run_and_tell heroku config:clear"

function heroku-help(){
  echo
  echo "Heroku Aliases"
  echo
  echo " hl         = heroku list"
	echo " hi         = heroku info"
	echo " ho         = heroku open"
	echo " hr         = heroku rake"
	echo " hcon       = heroku console"
	echo " hnew       = heroku create"
	echo " hrestart   = heroku restart"
	echo " hlog       = heroku logs"
	echo " hc         = heroku config"
	echo " hca        = heroku config:add"
	echo " hcr        = heroku config:remove"
	echo " hcc        = heroku config:clear"
  echo
}



#########


# Alias List: Homebrew

alias brup="run_and_tell run_and_tell brew update && brew upgrade"
alias brout="run_and_tell run_and_tell brew outdated"
alias bro="run_and_tell run_and_tell brew outdated"
alias brin="run_and_tell run_and_tell brew install"
alias brrm="run_and_tell run_and_tell brew uninstall"
alias brls="run_and_tell run_and_tell brew list"
alias brsr="run_and_tell run_and_tell brew search"
alias brinf="run_and_tell run_and_tell brew info"
alias brdr="run_and_tell run_and_tell brew doctor"

function homebrew-help(){
  echo
  echo "Homebrew Aliases"
  echo
  echo " brup       = run_and_tell brew update && brew upgrade"
	echo " brout      = run_and_tell brew outdated"
	echo " bro        = run_and_tell brew outdated"
	echo " brin       = run_and_tell brew install"
	echo " brrm       = run_and_tell brew uninstall"
	echo " brls       = run_and_tell brew list"
	echo " brsr       = run_and_tell brew search"
	echo " brinf      = run_and_tell brew info"
	echo " brdr       = run_and_tell brew doctor"
  echo
}



#########


# Alias List: Isidore_Custom

alias coding="run_and_tell cd ~/coding"
alias mh="run_and_tell cd ~/coding/MeadHall"
alias rfiles="run_and_tell cd ~/coding/ruby_files"
alias wp="run_and_tell cd ~/coding/web_projects"
alias exer="run_and_tell cd ~/coding/exercism.io"
alias euler="run_and_tell cd ~/coding/euler"
alias emberp="run_and_tell cd ~/coding/ember_projects"
alias ngp="run_and_tell cd ~/coding/angular_projects"
alias jsp="run_and_tell cd ~/coding/js_projects"
alias phpp="run_and_tell cd ~/coding/php_projects"
alias rp="run_and_tell cd ~/coding/rails_projects"
alias rpg="run_and_tell cd ~/coding/rails_projects/gems"
alias gene="run_and_tell cd ~/coding/rails_projects/genealogy_test"


function shuffle(){
  echo

  local i tmp size max rand
  array=( 'Get that shit out of you, and get that motivation to not give up and not be a quitter, no matter how much you just want to fall flat on your face' 'These are the times that try mens souls...Tyranny, like hell, is not easily conquered...the harder the conflict, the more glorious the triumph' 'Nothing is eaten as hot as it is cooked' 'Sometimes even to live is an act of courage' 'Ships are safe in harbor, but that is not what they are made for' 'All I know is that I know nothing' 'The best revenge is massive success' 'People often say that motivation doesnt last. Well, neither does bathing.  Thats why we recommend it daily' 'Fall seven times and stand up eight' 'If the wind will not serve, take to the oars' 'ASTRA INCLINANT NON OBLIGANT' 'When everything seems to be going against you, remember that the airplane takes off against the wind, not with it.' 'Nothing is impossible, the word itself says, Im possible!' 'Give me six hours to chop down a tree and I will spend the first four sharpening the axe' 'Common looking people are the best in the world: that is the reason the Lord makes so many of them' 'If I were two-faced, would I be wearing this one?')
  size=${#array[*]}
  max=$(( 32768 / size * size ))
  for ((i=size-1; i>0; i--)); do
  while (( (rand=$RANDOM) >= max )); do :; done
  rand=$(( rand % (i+1) ))
  tmp=${array[i]} array[i]=${array[rand]} array[rand]=$tmp
  done

  echo
  echo
}


function inspire(){
  echo

  shuffle
  echo "Quote:"
  echo "${array[1]}"
  echo

  echo
  echo
}

function isidore_custom-help(){
  echo
  echo "Isidore_custom Aliases"
  echo
  echo " coding     = cd ~/coding"
	echo " mh         = cd ~/coding/MeadHall"
	echo " rfiles     = cd ~/coding/ruby_files"
	echo " wp         = cd ~/coding/web_projects"
	echo " exer       = cd ~/coding/exercism.io"
	echo " euler      = cd ~/coding/euler"
	echo " emberp     = cd ~/coding/ember_projects"
	echo " ngp        = cd ~/coding/angular_projects"
	echo " jsp        = cd ~/coding/js_projects"
	echo " phpp       = cd ~/coding/php_projects"
	echo " rp         = cd ~/coding/rails_projects"
	echo " rpg        = cd ~/coding/rails_projects/gems"
	echo " gene       = cd ~/coding/rails_projects/genealogy_test"
	echo " inspire    = randomly be given an inspiring quote"
  echo
}



#########


# Alias List: Power_Git

alias mikedrop="run_and_tell git push origin master"
alias choochoo="run_and_tell git push origin master --force"


function gph(){
  echo
  echo "running: git push origin HEAD"
  echo

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

  echo
  echo
}

function power_git-help(){
  echo
  echo "Power_git Aliases"
  echo
  echo " mikedrop   = git push origin master"
	echo " choochoo   = git push origin master --force"
	echo " gph        = git push origin current branch (blocks master)"
  echo
}



#########


# Alias List: Rails

alias rc="run_and_tell rails console"
alias rgm="run_and_tell rails generate model"
alias rn="run_and_tell rails new"
alias rs="run_and_tell rails server"
alias rt="run_and_tell bundle exec rspec spec --format documentation"
alias frakit="run_and_tell echo Resetting the Fraking db; echo dropping db; rake db:drop; echo creating db; rake db:create; echo migrating db; rake db:migrate; echo seeding db; rake db:seed"


function rr(){
  echo

  if [ $# -gt 0 ]; then
    run_and_tell "rake routes | grep $1"
  else
    run_and_tell rake routes
  fi

  echo
  echo
}

function rails-help(){
  echo
  echo "Rails Aliases"
  echo
  echo " rc         = rails console"
	echo " rgm        = rails generate model"
	echo " rn         = rails new"
	echo " rs         = rails server"
	echo " rt         = bundle exec rspec spec --format documentation"
	echo " frakit     = echo Resetting the Fraking db; echo dropping db; rake db:drop; echo creating db; rake db:create; echo migrating db; rake db:migrate; echo seeding db; rake db:seed"
	echo " rr         = rake route (| grep \$1)"
  echo
}



#########


# Alias List: RSpec



function rtc(){
  echo

  if [ $# -gt 1 ]; then
    echo testing line $2 in $1 controller
    echo "rspec spec/controllers/$1_controller_spec.rb:$2;"
    rspec spec/controllers/$1_controller_spec.rb:$2;
  elif [ $# -gt 0 ]; then
    echo testing all of $1 controller
    echo "rspec spec/controllers/$1_controller_spec.rb"
    rspec spec/controllers/$1_controller_spec.rb;
  else
    echo testing all controllers
    echo "rspec spec/controllers/"
    rspec spec/controllers/;
  fi

  echo
  echo
}


function rtm(){
  echo

  if [ $# -gt 1 ]; then
    echo testing line $2 in $1 model
    echo "rspec spec/models/$1_spec.rb:$2;"
    rspec spec/models/$1_spec.rb:$2;
  elif [ $# -gt 0 ]; then
    echo testing all of $1 model
    echo "rspec spec/models/$1_spec.rb;"
    rspec spec/models/$1_spec.rb;
  else
    echo testing all of models
    echo "rspec spec/models/;"
    rspec spec/models/;
  fi

  echo
  echo
}

function rspec-help(){
  echo
  echo "Rspec Aliases"
  echo
  echo " rtc        = rspec test controller (\$1) line (\$2)"
	echo " rtm        = rspec test controller (\$1) line (\$2)"
  echo
}



#########


# Alias List: Url

alias goexer="run_and_tell open http://www.exercism.io/estensland"
alias goeuler="run_and_tell open http://projecteuler.net/problems"
alias gogit="run_and_tell open http://www.github.com/estensland"


function gorepo(){
  echo
  echo "running: openning repo url"
  echo

  URL=$(git --git-dir=.git config --get remote.origin.url | sed -e 's/\:/\//')
  URL=$(awk '{gsub(/git@/,"https://www.")}1' <<< $URL)
  open "$URL"

  echo
  echo
}

function url-help(){
  echo
  echo "Url Aliases"
  echo
  echo " goexer     = open http://www.exercism.io/estensland"
	echo " goeuler    = open http://projecteuler.net/problems"
	echo " gogit      = open http://www.github.com/estensland"
	echo " gorepo     = opens git remote origin url"
  echo
}



#########


# Alias List: Zeus

alias zc="run_and_tell zeus c"
alias zr="run_and_tell zeus rake"
alias zs="run_and_tell zeus start"


function ztc(){
  echo

  if [ $# -gt 1 ]; then
    echo testing line $2 in $1 controller
    zeus rspec spec/controllers/$1_controller_spec.rb:$2;
  elif [ $# -gt 0 ]; then
    echo testing all of $1 controller
    zeus rspec spec/controllers/$1_controller_spec.rb;
  else
    echo testing all controllers
    zeus rspec spec/controllers/;
  fi

  echo
  echo
}


function ztm(){
  echo

  if [ $# -gt 1 ]; then
    echo testing line $2 in $1 model
    zeus rspec spec/models/$1_spec.rb:$2;
  elif [ $# -gt 0 ]; then
    echo testing all of $1 model
    zeus rspec spec/models/$1_spec.rb;
  else
    echo testing all of models
    zeus rspec spec/models/;
  fi

  echo
  echo
}

function zeus-help(){
  echo
  echo "Zeus Aliases"
  echo
  echo " zc         = zeus c"
	echo " zr         = zeus rake"
	echo " zs         = zeus start"
	echo " ztc        = zeus test controller (\$1) line (\$2)"
	echo " ztm        = zeus test controller (\$1) line (\$2)"
  echo
}



#########
