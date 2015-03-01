
export PATH="$HOME/bin:/usr/local/bin:$PATH"

PATH="~/.rbenv/shims:$PATH"

# Enable Options:
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkwinsize



source ~/coding/MeadHall/dotfiles/aliases/.aliases.sh

if [ -f ~/.bash_prompt ]; then
  source ~/coding/MeadHall/dotfiles/.bash_prompt
fi

if [ -f ~/.git-prompt.sh ]; then
  source ~/coding/MeadHall/dotfiles/.git-prompt.sh
fi

if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi

export PATH=/usr/local/share/npm/bin:$PATH
# export LD_LIBRARY_PATH=/home/$USER/.rbenv/versions/2.1.1/lib:$LD_LIBRARY_PATH
export PATH="$HOME/.rbenv/bin:$PATH"


eval "$(rbenv init -)"
