
export PATH="$HOME/bin:/usr/local/bin:$PATH"

PATH="~/.rbenv/shims:$PATH"

# Enable Options:
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkwinsize



source ~/MeadHall/dotfiles/aliases/.aliases

if [ -f ~/.bash_prompt ]; then
  source ~/MeadHall/dotfiles/.bash_prompt
fi

if [ -f ~/.git-prompt.sh ]; then
  source ~/MeadHall/dotfiles/.git-prompt.sh
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
