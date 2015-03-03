alias reshell='source ~/.bash_profile'

alias ..='cd ..'
alias ...='cd ../..'

alias hitme='git pull origin master'

alias goapp='cd /home/rails'

alias reuni='service unicorn restart'

rc(){
  goapp
  rails c production
}

db_create(){
  goapp
  rake db:create RAILS_ENV=production
}

db_seed(){
  goapp
  rake db:seed RAILS_ENV=production
}

migrate(){
  goapp
  rake db:migrate RAILS_ENV=production
}

rerock() {
  echo
  echo "pulling code from master then restarting unicorn"
  goapp
  echo
  echo "pulling from remote origin master"
  hitme
  echo
  echo "precompiling assets"
  echo
  rake assets:precompile RAILS_ENV=production
  echo
  echo
  echo "restarting unicorn"
  echo
  reuni
}

# PS1='${debian_chroot:+($debian_chroot)}\[\033[38;1m\033[33;34m\u\033[33;31m@\033[01;34m\]\H\033[31m:\033[36m\t\033[31m:\033[01;34m\w\033[01;31;1m\] ⌘  \033[00m\]'
