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


# Alias List: Basic

alias reshell="run_and_tell source ~/.bash_profile"
alias ..="run_and_tell cd .."
alias ...="run_and_tell cd ..."
alias lg="run_and_tell ls -G"
alias la="run_and_tell ls -AF"
alias ll="run_and_tell ls -alh"
alias l="run_and_tell ls -a"
alias l1="run_and_tell ls -1"
alias lo="run_and_tell ls -l | sed -e 's/--x/1/g' -e 's/-w-/2/g' -e 's/-wx/3/g' -e 's/r--/4/g' -e 's/r-x/5/g' -e 's/rw-/6/g' -e 's/rwx/7/g' -e 's/---/0/g'"
alias recent="run_and_tell ls -lAt | head"
alias old="run_and_tell ls -lAt | tail"

function basic-help(){
  echo "Basic Aliases"
  echo
  echo " reshell    = source ~/.bash_profile"
	echo " ..         = cd .."
	echo " ...        = cd ..."
	echo " lg         = ls -G"
	echo " la         = ls -AF"
	echo " ll         = ls -alh"
	echo " l          = ls -a"
	echo " l1         = ls -1"
	echo " lo         = ls -l | sed -e 's/--x/1/g' -e 's/-w-/2/g' -e 's/-wx/3/g' -e 's/r--/4/g' -e 's/r-x/5/g' -e 's/rw-/6/g' -e 's/rwx/7/g' -e 's/---/0/g'"
	echo " recent     = ls -lAt | head"
	echo " old        = ls -lAt | tail"
  echo
}



#########


# Alias List: Custom

alias bashprof="run_and_tell subl ~/.bash_profile"
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

function custom-help(){
  echo "Custom Aliases"
  echo
  echo " bashprof   = subl ~/.bash_profile"
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
alias mikedrop="run_and_tell git push origin master"
alias choochoo="run_and_tell git push origin master --force"
alias hitme="run_and_tell git pull origin master"
alias cmdz="run_and_tell git reset --soft HEAD~1"
alias gac="run_and_tell_quoted_inputs 'git add . ; git commit -m'"
alias gc="run_and_tell_quoted_inputs 'git commit -m'"

function git-help(){
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
	echo " mikedrop   = git push origin master"
	echo " choochoo   = git push origin master --force"
	echo " hitme      = git pull origin master"
	echo " cmdz       = git reset --soft HEAD~1"
	echo " gac        = git add . ; git commit -m"
	echo " gc         = git commit -m"
  echo
}



#########


# Alias List: Bundler

alias b="run_and_tell bundle"
alias bi="run_and_tell bundle install --path vendor"
alias be="run_and_tell bundle exec"
alias bl="run_and_tell bundle list"
alias bu="run_and_tell bundle update"
alias bp="run_and_tell bundle package"

function bundler-help(){
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


# Alias List: Rails

alias rc="run_and_tell rails console"
alias rgm="run_and_tell rails generate model"
alias rn="run_and_tell rails new"
alias rs="run_and_tell rails server"
alias rt="run_and_tell bundle exec rspec spec --format documentation"

function rails-help(){
  echo "Rails Aliases"
  echo
  echo " rc         = rails console"
	echo " rgm        = rails generate model"
	echo " rn         = rails new"
	echo " rs         = rails server"
	echo " rt         = bundle exec rspec spec --format documentation"
  echo
}



#########
