# Rspec Aliases

function rtc(){
  if [ $# -gt 1 ]; then
   echo testing line $2 in $1 controller
   rake SPEC='spec/controllers/$1_controller_spec.rb:$2';
  else
   echo testing all of $1 controller
   rake SPEC='spec/controllers/$1_controller_spec.rb';
  fi
}

function rtm(){
  if [ $# -gt 1 ]; then
   echo testing line $2 in $1 model
   rake SPEC='spec/models/$1_spec.rb:$2';
  else
   echo testing all of $1 model
   rake SPEC='spec/models/$1_spec.rb';
  fi
}

rspec-help () {
  echo "Rspec Aliases"
  echo
  echo "rtm() = rake SPEC='spec/models/$1_spec.rb:$2'"
  echo "rtc() = rake SPEC='spec/controllers/$1_controller_spec.rb:$2'"
  echo
  echo "fuck_it = kill server, db:reset, rails s"
  echo
}
