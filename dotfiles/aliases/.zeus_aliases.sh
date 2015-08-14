# Zeus Aliases
batch_alias_create  \
"zc:zeus c" \
"zr:zeus rake" \
"zs:zeus start"

function ztc(){
  if [ $# -gt 1 ]; then
    echo testing line $2 in $1 controller
    zeus rspec spec/controllers/$1_controller_spec.rb:$2;
  elif [ $# -gt 0 ]; then
    echo testing all of $1 controller
    zeus rspec spec/controllers/$1_controller_spec.rb;
  else
    echo testing all controllers
    zeus rspec spec/controllers/;
  fi
}

function ztm(){
  if [ $# -gt 1 ]; then
    echo testing line $2 in $1 model
    zeus rspec spec/models/$1_spec.rb:$2;
  elif [ $# -gt 0 ]; then
    echo testing all of $1 model
    zeus rspec spec/models/$1_spec.rb;
  else
    echo testing all of models
    zeus rspec spec/models/;
  fi
}

zeus-help () {
  echo "Zeus Aliases"
  echo
  echo " Static"
  echo
  echo " zc  = zeus c"
  echo " zr  = zeus rake"
  echo " zs  = zeus start"
  echo
  echo " Inputs"
  echo
  echo " ztc = zeus rspec spec/models/1_spec.rb:2; or /1_spec.rb"
  echo " ztm = zeus rspec spec/controllers/1_controller_spec.rb:2; or /1_spec.rb"
  echo
}
