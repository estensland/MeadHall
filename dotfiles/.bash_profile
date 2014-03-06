
export PATH="$HOME/bin:/usr/local/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias edit='subl' 



source ~/.aliases

if [ -f ~/.bash_prompt ]; then
  source ~/.bash_prompt
fi

if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi