require 'rake'
# require 'rspec/core/rake_task'

require ::File.expand_path('../config/environment', __FILE__)

# Include all of ActiveSupport's core class extensions, e.g., String#camelize
require 'active_support/core_ext'

namespace :generate do
  desc "Create an empty model in app/models, e.g., rake generate:model NAME=User"
  task :model do
    unless ENV.has_key?('NAME')
      raise "Must specificy model name, e.g., rake generate:model NAME=User"
    end

    model_name     = ENV['NAME'].camelize
    model_filename = ENV['NAME'].underscore + '.rb'
    model_path = APP_ROOT.join('app', 'models', model_filename)

    if File.exist?(model_path)
      raise "ERROR: Model file '#{model_path}' already exists"
    end

    puts "Creating #{model_path}"
    File.open(model_path, 'w+') do |f|
      f.write(<<-EOF.strip_heredoc)
        class #{model_name} < ActiveRecord::Base
          # has_many
          # belongs_to
          # Remember to create a migration!
        end
      EOF
    end
  end

  desc "Create an empty migration in db/migrate, e.g., rake generate:migration NAME=create_tasks"
  task :migration do
    unless ENV.has_key?('NAME')
      raise "Must specificy migration name, e.g., rake generate:migration NAME=create_tasks"
    end

    name     = ENV['NAME'].camelize
    filename = "%s_%s.rb" % [Time.now.strftime('%Y%m%d%H%M%S'), ENV['NAME'].underscore]
    path     = APP_ROOT.join('db', 'migrate', filename)

    if File.exist?(path)
      raise "ERROR: File '#{path}' already exists"
    end
    puts name
    table_name = name.underscore.match("create_").post_match

    puts "Creating #{path}"
    File.open(path, 'w+') do |f|
      f.write(<<-EOF.strip_heredoc)
        class #{name} < ActiveRecord::Migration
          def change
            create_table :#{table_name} do |t|

              t.timestamps
            end
          end
        end
      EOF
    end
  end

  desc "Create an empty folder in views"
  task :controller do
    unless ENV.has_key?('NAME')
      raise "Must specificy controller name, e.g., rake generate:controller NAME=user"
    end

    name     = ENV['NAME'].downcase
    filename = ENV['NAME'].pluralize.underscore + '.rb'
    path     = APP_ROOT.join('app', 'controllers', filename)

    if File.exist?(path)
      raise "ERROR: File '#{path}' already exists"
    end

    puts "Creating #{path}"
    File.open(path, 'w+') do |f|
      f.write(<<-EOF.strip_heredoc)

        get '/#{name}/new/:id' do
          
          erb :"#{name}_views/new"
        end

        get '/#{name}/show/:id' do
          
          erb :"#{name}_views/show"
        end

        get '/#{name}/edit/:id' do
          
          erb :"#{name}_views/edit"
        end 

        get '/#{name}/delete/:id' do
          
          erb :"#{name}_views/delete"
        end

        post '/#{name}/new' do
          new_object = #{name.camelize}.new(params[#{name}])
          if new_object.save
            redirect to("/#{name}_views/all")
          else
            @errors = #{name}.errors.messages
            erb :"#{name}_views/new"
          end
        end

        post '/#{name}/edit' do
          edit_object = #{name.camelize}.find(params[:#{name}_id])
          edit_object.update_attributes(params)
          redirect to('/')
        end

        post '/#{name}/delete' do
          #{name} = #{name.camelize}.find( )
          #{name}.destroy
          redirect to('/')
        end

      EOF
     end
  end


  desc "Create an empty model spec in spec, e.g., rake generate:spec NAME=user"
  task :spec do
    unless ENV.has_key?('NAME')
      raise "Must specificy migration name, e.g., rake generate:spec NAME=user"
    end

    name     = ENV['NAME'].camelize
    filename = "%s_spec.rb" % ENV['NAME'].underscore
    path     = APP_ROOT.join('spec', filename)

    if File.exist?(path)
      raise "ERROR: File '#{path}' already exists"
    end

    puts "Creating #{path}"
    File.open(path, 'w+') do |f|
      f.write(<<-EOF.strip_heredoc)
        require 'spec_helper'

        describe #{name} do
          pending "add some examples to (or delete) #{__FILE__}"
        end
      EOF
    end
  end


  desc "Creating MVC....and migration...ignore migration at own risk"
  task :scaffold do
    unless ENV.has_key?('NAME')
      raise "Must specificy model name, e.g., rake generate:scaffold NAME=user"
    end

    puts "Scaffold activated"

    name     = ENV['NAME'].downcase
    migration_name = "create_#{ENV['NAME'].downcase.pluralize}"

    puts "Making all the stuff for the #{name} table...sit and relax"

    exec(<<-EOF.strip_heredoc
        mkdir app/views/#{name}_views
        touch app/views/#{name}_views/edit.erb
        touch app/views/#{name}_views/new.erb
        touch app/views/#{name.singularize}_views/show.erb
        bundle exec rake generate:model NAME=#{name}
        bundle exec rake generate:controller NAME=#{name.downcase}
        bundle exec rake generate:migration NAME=#{migration_name}
      EOF
      )

  end

  desc "Deleting all aspects of a table and MVC"
  task :delete do
    unless ENV.has_key?('NAME')
      raise "Must specificy a MVC to delete, e.g., rake generate:scaffold NAME=user"
    end

    puts "Wildfire Deletion Activated"

    name     = ENV['NAME'].downcase
    migration_name = "create_#{ENV['NAME'].downcase.pluralize}"

    puts "Deleting all the stuff related to the #{name} table...watch it burn"

    files = Dir.entries( 'db/migrate' )
    delete = []

    files.each { |file| delete << file if file.match(name.downcase.pluralize)}

    exec(<<-EOF.strip_heredoc
        rm app/views/#{name}_views/edit.erb
        rm app/views/#{name}_views/new.erb
        rm app/views/#{name}_views/show.erb
        rmdir app/views/#{name}_views
        rm db/migrate/#{delete[0]}
        rm app/models/#{name.downcase}.rb
        rm app/controllers/#{name.downcase.pluralize}.rb
      EOF
      )

  end
end

namespace :db do


  desc "Create the database at #{DB_NAME}"
  task :create do
    puts "Creating database #{DB_NAME} if it doesn't exist..."
    exec("createdb #{DB_NAME}")
  end

  desc "Drop the database at #{DB_NAME}"
  task :drop do
    puts "Dropping database #{DB_NAME}..."
    exec("dropdb #{DB_NAME}")
  end

  desc "Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
  task :migrate do
    ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
    ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
    ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
      ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
    end
  end

  desc "Populate the database with dummy data by running db/seeds.rb"
  task :seed do
    require APP_ROOT.join('db', 'seeds.rb')
  end

  desc "Returns the current schema version number"
  task :version do
    puts "Current version: #{ActiveRecord::Migrator.current_version}"
  end


  # CUSTOM TASKS...

  desc "reset the database"
  task :reset do
    puts "resetting the frakking db"
    exec("bundle exec rake db:drop && bundle exec rake db:set")
  end

  desc "set the database"
  task :set do
    puts "Create-Migrate-Seed...ALL AT ONCE"
    exec("bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rake db:seed")
  end

  desc "create/migrate/seed db and open the console"
  task :conset do
    puts "Bundle, Setting db, and entering console"
    exec("bundle update && bundle exec rake db:drop && bundle exec rake console")
  end

  desc "reset the db and opening the console"
  task :conreset do
    puts "Reset to Console..."
    exec("bundle exec rake db:reset && bundle exec rake console")
  end

end

desc 'Start User-InterRake'
task "launch" do
  puts "Starting User-InterRake"
  
  loop do
    puts "==== User-InterRake ===="
    puts "Type in a string of commands in order:"
    puts "'q' -> quit"
    puts "'b' -> bundle update"
    puts "'s' -> scaffold"
    puts "'i' -> initialize db (bundle update/create/migrate/seed) "
    puts "'h' -> hard initialize (initialize to console)"
    puts "'r' -> hard reset db (bundle update/drop/create/migrate/seed" 
    puts "'c' -> exit to console"
    puts "'x' -> hard reset then console"
    puts "'g' -> git add and commit"
    input = STDIN.gets.chomp
    
    commands = ""
    console = false

    input.split('').each do |letter|
      case letter
      when "q" then break
      when "b"
        puts "bundling"
        commands << (<<-EOF
          bundle
          EOF
          )      
      when "i"
        puts "Bundle through seeding"
        commands << (<<-EOF
          bundle exec rake db:set
          EOF
          )
      when "s"
        puts "NAME= ?"
        scaffold_input = STDIN.gets.chomp
        commands << (<<-EOF
          bundle exec rake generate:scaffold NAME=#{scaffold_input}
          EOF
          )
      when "r"
        commands << (<<-EOF
          bundle exec rake db:reset
          EOF
          )
      when "d"
        puts "WARNING DELETING! BE CAREFUL THERE IS NO GOING BACK!"
        puts "======================================================"
        puts "NAME= ?"
        puts "======================================================"
        puts "SERIOUSLY THOUGH!!! DELETING! TYPE IN NAME=?"
        puts "======================================================"
        delete_input = STDIN.gets.chomp
        commands << (<<-EOF
          bundle exec rake generate:delete NAME=#{delete_input}
          EOF
          )
      when "c"
        puts "It's console time"
        console = true
        commands << (<<-EOF
          bundle exec rake console
          EOF
          ) 
      when "g"
        puts "Type your commit message"
        message = STDIN.gets.chomp
        commands << (<<-EOF
          git add .
          git commit -m "#{message}"
          EOF
          )    
      end
    end
    
    unless console
      commands << (<<-EOF
          bundle exec rake launch
          EOF
          )
    end

    exec(commands)
  end
end


desc 'Start IRB with application environment loaded'
task "console" do
  exec "irb -r./config/environment"
end

# desc "Run the specs"
# RSpec::Core::RakeTask.new(:spec)

# task :default  => :specs
