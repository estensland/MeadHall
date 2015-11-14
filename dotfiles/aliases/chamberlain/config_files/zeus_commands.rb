{
  name: 'Zeus',
  aliases: {
    zc: 'zeus c',
    zr: 'zeus rake',
    zs: 'zeus start'
  },
  custom_functions:{
    ztc: {
      helper_descrpition: 'zeus test controller (\$1) line (\$2)',
      command:
"if [ $# -gt 1 ]; then
echo testing line $2 in $1 controller
zeus rspec spec/controllers/$1_controller_spec.rb:$2;
elif [ $# -gt 0 ]; then
echo testing all of $1 controller
zeus rspec spec/controllers/$1_controller_spec.rb;
else
echo testing all controllers
zeus rspec spec/controllers/;
fi"
    },
    ztm: {
      helper_descrpition: 'zeus test controller (\$1) line (\$2)',
      command:
"if [ $# -gt 1 ]; then
echo testing line $2 in $1 model
zeus rspec spec/models/$1_spec.rb:$2;
elif [ $# -gt 0 ]; then
echo testing all of $1 model
zeus rspec spec/models/$1_spec.rb;
else
echo testing all of models
zeus rspec spec/models/;
fi"
    },
  }
}