# Heroku Aliases

alias hl='heroku list'
alias hi='heroku info'
alias ho='heroku open'

# rake console
alias hr='heroku rake'
alias hcon='heroku console'

# new and restart
alias hnew='heroku create'
alias hrestart='heroku restart'

# logs
alias hlog='heroku logs'

# heroku configs
alias hc='heroku config'
alias hca='heroku config:add'
alias hcr='heroku config:remove'
alias hcc='heroku config:clear'

alias hp="git push heroku"
alias hpm="git push heroku master"


heroku-help () {
  echo "Heroku Aliases Usage"
  echo
  echo "  h           = heroku"
  echo "  hl          = heroku list"
  echo "  hi          = heroku info"
  echo "  ho          = heroku open"
  echo "  hr          = heroku rake"
  echo "  hcon        = heroku console"
  echo "  hnew        = heroku create"
  echo "  hrestart    = heroku restart"
  echo "  hlog        = heroku logs"
  echo "  hon         = heroku maintenance:on"
  echo "  hoff        = heroku maintenance:off"
  echo "  hc          = heroku config"
  echo "  hca         = heroku config:add"
  echo "  hcr         = heroku config:remove"
  echo "  hcc         = heroku config:clear"
  echo "  hp          = git push heroku"
  echo "  hpm         = git push heroku master"
  echo
}
