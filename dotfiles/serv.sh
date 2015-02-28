alias reshell='source ~/.bash_profile'

alias ..='cd ..'
alias ...='cd ../..'

alias hitme='git pull origin master'

alias goapp='cd /home/rails'

alias reuni='service unicorn restart'

rerock() {
  echo
  echo "pulling code from master then restarting unicorn"
  echo
  echo "pulling from remote origin master"
  hitme
  echo
  echo "restarting unicorn"
  echo
  reuni
}

# PS1='${debian_chroot:+($debian_chroot)}\[\033[38;1m\033[33;34m\u\033[00m\]\033[33;31m@\033[00m\]\033[01;34$
