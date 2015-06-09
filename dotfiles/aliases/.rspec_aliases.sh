# Rspec Aliases

function rtc(){
  if [ $# -gt 1 ]; then
    echo testing line $2 in $1 controller
    echo "rspec spec/controllers/$1_controller_spec.rb:$2;"
    rspec spec/controllers/$1_controller_spec.rb:$2;
  elif [ $# -gt 0 ]; then
    echo testing all of $1 controller
    echo "rspec spec/controllers/$1_controller_spec.rb"
    rspec spec/controllers/$1_controller_spec.rb;
  else
    echo testing all controllers
    echo "rspec spec/controllers/"
    rspec spec/controllers/;
  fi
}

function rtm(){
  if [ $# -gt 1 ]; then
    echo testing line $2 in $1 model
    echo "rspec spec/models/$1_spec.rb:$2;"
    rspec spec/models/$1_spec.rb:$2;
  elif [ $# -gt 0 ]; then
    echo testing all of $1 model
    echo "rspec spec/models/$1_spec.rb;"
    rspec spec/models/$1_spec.rb;
  else
    echo testing all of models
    echo "rspec spec/models/;"
    rspec spec/models/;
  fi
}

rspec-help () {
  echo "Rspec Aliases"
  echo
  echo "rtm() = rake SPEC='spec/models/$1_spec.rb:$2'"
  echo "rtc() = rake SPEC='spec/controllers/$1_controller_spec.rb:$2'"
  echo
}
