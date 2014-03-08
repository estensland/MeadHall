export PATH="$HOME/bin:/usr/local/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


shopt -s cdspell


source ~/MeadHall/dotfiles/.aliases

if [ -f ~/.bash_prompt ]; then
  source ~/MeadHall/dotfiles/.bash_prompt
fi

if [ -f ~/.git-prompt.sh ]; then
  source ~/MeadHall/dotfiles/.git-prompt.sh
fi