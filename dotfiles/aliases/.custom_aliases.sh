# Custom Aliases

# Open Files

batch_alias_create  \
"bashprof:subl ~/.bash_profile"

# Quick Ins to Coding Directories

batch_alias_create  \
"coding:cd ~/coding" \
"mh:cd ~/coding/MeadHall" \
"rfiles:cd ~/coding/ruby_files" \
"wp:cd ~/coding/web_projects" 

# alias mh='cd ~/coding/MeadHall'
# alias rfiles='cd ~/coding/ruby_files'
# alias wp='cd ~/coding/web_projects'

# Repos of Challenges
batch_alias_create  \
"exer:cd ~/coding/exercism.io" \
"euler:cd ~/coding/euler"
# alias exer='cd ~/coding/exercism.io'
# alias euler='cd ~/coding/euler'

# Web Dev Projects by Language

batch_alias_create  \
"emberp:cd ~/coding/ember_projects" \
"ngp:cd ~/coding/angular_projects" \
"jsp:cd ~/coding/js_projects" \
"phpp:cd ~/coding/php_projects" \
"rp:cd ~/coding/rails_projects" 

# alias emberp='cd ~/coding/ember_projects'
# alias ngp='cd ~/coding/angular_projects'
# alias jsp='cd ~/coding/js_projects'
# alias phpp='cd ~/coding/php_projects'
# alias rp='cd ~/coding/rails_projects'

# Local Ruby Gems

batch_alias_create  \
"rpg:cd ~/coding/rails_projects/gems"
"gene:cd ~/coding/rails_projects/genealogy_test"

# alias rpg='cd ~/coding/rails_projects/gems'
# alias gene='cd ~/coding/rails_projects/genealogy_test'

# Nothing but random:

inspire() {
  shuffle
  echo
  echo "Quote:"
  echo "${array[1]}"
  echo
}

shuffle() {
   local i tmp size max rand

   size=${#array[*]}
   max=$(( 32768 / size * size ))

   for ((i=size-1; i>0; i--)); do
      while (( (rand=$RANDOM) >= max )); do :; done
      rand=$(( rand % (i+1) ))
      tmp=${array[i]} array[i]=${array[rand]} array[rand]=$tmp
   done
}

array=( 'Get that shit out of you, and get that motivation to not give up and not be a quitter, no matter how much you just want to fall flat on your face' 'These are the times that try mens souls...Tyranny, like hell, is not easily conquered...the harder the conflict, the more glorious the triumph' 'Nothing is eaten as hot as it is cooked' 'Sometimes even to live is an act of courage' 'Ships are safe in harbor, but that is not what they are made for' 'All I know is that I know nothing' 'The best revenge is massive success' 'People often say that motivation doesn’t last. Well, neither does bathing.  That’s why we recommend it daily' 'Fall seven times and stand up eight' 'If the wind will not serve, take to the oars' 'ASTRA INCLINANT NON OBLIGANT' 'When everything seems to be going against you, remember that the airplane takes off against the wind, not with it.' 'Nothing is impossible, the word itself says, I’m possible!' 'Give me six hours to chop down a tree and I will spend the first four sharpening the axe' 'Common looking people are the best in the world: that is the reason the Lord makes so many of them' 'If I were two-faced, would I be wearing this one?')

custom-help () {
  echo " Custom Aliases"
  echo
  echo " bashprof = subl ~/.bash_profile"
  echo
  echo " Quick Ins to Coding Directories"
  echo " coding = cd ~/coding"
  echo " mh     = cd ~/coding/MeadHall"
  echo " rfiles = cd ~/coding/ruby_files"
  echo " webp   = cd ~/coding/web_projects"
  echo
  echo " Repos of Challenges"
  echo
  echo " exer  = cd ~/coding/exercism.io"
  echo " euler = cd ~/coding/project_euler"
  echo
  echo " Web Dev Projects by Language"
  echo
  echo " emberp = cd ~/coding/ember_projects"
  echo " phpp   = cd ~/coding/php_projects"
  echo " rp     = cd ~/coding/rails_projects"
  echo
  echo " Local Ruby Gems"
  echo
  echo " rpg  = cd ~/coding/rails_projects/gems"
  echo " gene = cd ~/coding/rails_projects/genealogy_test"
  echo
  echo " Heights of Randomness"
  echo " inspire = ?"
  echo
}
