alias reload='source ~/.bash_profile'

alias ..='cd ..'
alias ...='cd ../..'
alias -='cd -'

alias hitme='git pull origin master'

alias reuni='service unicorn restart'

alias rerock='echo  && hitme && service unicorn reuni'

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