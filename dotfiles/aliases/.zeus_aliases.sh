# Zeus Aliases

alias zc='zeus c'
alias zr='zeus rake'
alias zs='zeus start'

function ztc(){
  if [ $# -gt 1 ]; then
      echo testing line $2 in $1 controller
      zeus rspec spec/controllers/$1_controller_spec.rb:$2;
  else
      echo testing all of $1 controller
      zeus rspec spec/controllers/$1_controller_spec.rb;
  fi
}

function ztm(){
  if [ $# -gt 1 ]; then
      echo testing line $2 in $1 model
      zeus rspec spec/models/$1_spec.rb:$2;
  else
      echo testing all of $1 model
      zeus rspec spec/models/$1_spec.rb;
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