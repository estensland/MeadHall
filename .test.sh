# run and tell function runs the alias, but says what the real command was

function run_and_tell(){
  echo
  echo Running: $1
  echo
  eval $1
  echo
}
