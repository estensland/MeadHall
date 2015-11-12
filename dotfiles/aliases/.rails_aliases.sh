# Rails Aliases

batch_alias_create  \
"rc:rails c" \
"rgm:rails generate model" \
"rn:rails new" \
"rs:rails s" \
"rt:bundle exec rspec spec --format documentation"

function rr() {
  if [ $# -gt 0 ]; then
    run_and_tell "rake routes | grep $1"
  else
    run_and_tell rake routes
  fi
}



# Drop, Create, Migrate, Seed
alias reset='echo Resetting the Fraking db && echo dropping db && rake db:drop && echo creating db && rake db:create && echo migrating db  && rake db:migrate && echo seeding db && rake db:seed'

# Drop, Create, Migrate, Seed, Restart Server
alias fuck_it='echo Resetting the Fraking db && echo dropping db && bundle exec rake db:drop && echo creating db && bundle exec rake db:create && echo migrating db  && bundle exec rake db:migrate && echo seeding db && bundle exec rake db:seed && echo Restarting Server && rails server'

rails-help () {
  echo "Rails Aliases"
  echo
  echo "rc   = rails c"
  echo "rgm  = rails generate model"
  echo "rn   = rails new"
  echo "rr() = rake routes | grep $1"
  echo "rs   = rails s"
  echo "rt   = bundle exec rspec spec --format documentation"
  echo
  echo "seed    = rake db:seed"
  echo "reset   = rake db:reset"
  echo
  echo "fuck_it = db:reset, rails s"
  echo
}
