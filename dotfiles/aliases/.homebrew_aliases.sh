# Homebrew Aliases
batch_alias_create  \
"brup:brew update && brew upgrade" \
"brout:brew outdated" \
"bro:brew outdated" \
"brin:brew install" \
"brrm:brew uninstall" \
"brls:brew list" \
"brsr:brew search" \
"brinf:brew info" \
"brdr:brew doctor"

brew-help () {
  echo "Homebrew Aliases"
  echo
  echo " brup  = brew update && brew upgrade"
  echo " brout = brew outdated"
  echo " brin  = brew install"
  echo " brrm  = brew uninstall"
  echo " brls  = brew list"
  echo " brsr  = brew search"
  echo " brinf = brew info"
  echo " brdr  = brew doctor"
  echo
}
