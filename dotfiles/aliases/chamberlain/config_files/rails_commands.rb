{
  name: 'Rails',
  aliases: {
    rc: "rails console",
    rgm: "rails generate model",
    rn: "rails new",
    rs: "rails server",
    rt: "bundle exec rspec spec --format documentation",
    frakit:  'echo Resetting the Fraking db; echo dropping db; rake db:drop; echo creating db; rake db:create; echo migrating db; rake db:migrate; echo seeding db; rake db:seed'
  },
  custom_functions:{
    rr:{
      helper_descrpition: 'rake route (| grep \$1)',
      command:
"if [ $# -gt 0 ]; then
run_and_tell \"rake routes | grep $1\"
else
run_and_tell rake routes
fi"
    }
  }
}