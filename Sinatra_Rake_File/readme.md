Sinatra_Rake_File
========

####This is a custom Rakefile to be used with an essentially "Ruby-lite" Sinatra Skeleton


- "rake db:set" creates, migrates, seeds

- "rake db:reset" drops, creates, migrates, seeds

- "rake db:con#{set || reset}" performs task but then opens to the console

- "rake db:rest" drops, creates, migrates, seeds

- "rake generate:scaffold" executes generate: for controller, helper, model, base views, and migration

- "rake generate:delete" removes everything that scaffold creates

- "rake launch" opens the interface, executes commnads in the order typed in. For example: "bssi" would bundle, run scaffold twice, then init the database.


