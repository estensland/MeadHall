Sinatra_Rake_File

- "rake db:set" creates, migrates, seeds

- "rake db:reset" drops, creates, migrates, seeds

- "rake db:con#{set || reset}" performs task but then opens to the console

- "rake db:rest" drops, creates, migrates, seeds

- "rake generate:scaffold" executes generate: for controller, helper, model, base views, and migration

- "rake generate:delete" removes everything that scaffold creates

- "rake launch" opens the interface, executes commnads in the order that you type them originally in... eg. "bssi" would bundle, scaffold twice, then init the database


