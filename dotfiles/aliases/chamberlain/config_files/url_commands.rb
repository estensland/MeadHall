{
  name: 'Url',
  aliases: {
    goexer: 'open http://www.exercism.io/estensland',
    goeuler: 'open http://projecteuler.net/problems',
    gogit: 'open http://www.github.com/estensland'
  },
  custom_functions:{
    gorepo: {
      echo_description: 'openning repo url',
      helper_descrpition: 'opens git remote origin url',
      command:
"URL=$(git --git-dir=.git config --get remote.origin.url | sed -e 's/\\:/\\//')
URL=$(awk '{gsub(/git@/,\"https://www.\")}1' <<< $URL)
open \"$URL\""
    }
  }
}