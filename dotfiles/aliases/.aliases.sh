# Alias generator that also echoes what the original command was
function alias_gen(){
  echo
  echo Running: $1
  echo
  eval $1
  echo
}

# Basic General Commands

alias edit='subl'

#alias reshell='source ~/.bash_profile'

function reshell(){alias_gen('source ~/.bash_profile')}

alias pgstart='pg_ctl -D /usr/local/var/postgres -l logfile start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop'

alias mysqlstart='mysql.server start'

alias ..='cd ..'

alias ...='cd ../..'
alias -- -='cd -'


# List directory contents
alias sl=ls
function sl(){alias_gen('ls -G')
alias ls='ls -G'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -alh'
alias l='ls -a'
alias l1='ls -1'
alias lo='ls -l | sed -e 's/--x/1/g' -e 's/-w-/2/g' -e 's/-wx/3/g' -e 's/r--/4/g' -e 's/r-x/5/g' -e 's/rw-/6/g' -e 's/rwx/7/g' -e 's/---/0/g''  # convert permissions to octal

alias recent='ls -lAt | head'
alias old='ls -lAt | tail'

# Grab from other alias files

if [ -f ~/coding/MeadHall/dotfiles/aliases/.bundler_aliases.sh ]; then
  source ~/coding/MeadHall/dotfiles/aliases/.bundler_aliases.sh
fi

if [ -f ~/coding/MeadHall/dotfiles/aliases/.custom_aliases.sh ]; then
  source ~/coding/MeadHall/dotfiles/aliases/.custom_aliases.sh
fi

if [ -f ~/coding/MeadHall/dotfiles/aliases/.homebrew_aliases.sh ]; then
  source ~/coding/MeadHall/dotfiles/aliases/.homebrew_aliases.sh
fi

if [ -f ~/coding/MeadHall/dotfiles/aliases/.heroku_aliases.sh ]; then
  source ~/coding/MeadHall/dotfiles/aliases/.heroku_aliases.sh
fi

if [ -f ~/coding/MeadHall/dotfiles/aliases/.git_aliases.sh ]; then
  source ~/coding/MeadHall/dotfiles/aliases/.git_aliases.sh
fi

if [ -f ~/coding/MeadHall/dotfiles/aliases/.rails_aliases.sh ]; then
  source ~/coding/MeadHall/dotfiles/aliases/.rails_aliases.sh
fi

if [ -f ~/coding/MeadHall/dotfiles/aliases/.url_aliases.sh ]; then
  source ~/coding/MeadHall/dotfiles/aliases/.url_aliases.sh
fi

if [ -f ~/coding/MeadHall/dotfiles/aliases/.zeus_aliases.sh ]; then
  source ~/coding/MeadHall/dotfiles/aliases/.zeus_aliases.sh
fi
