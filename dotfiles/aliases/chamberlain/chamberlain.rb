require '~/coding/MeadHall/dotfiles/aliases/chamberlain/run_and_tell.rb'

class Chamberlain

  #### INSTANCE METHODS

  def self.run
    # set path
    path = "~/coding/MeadHall/dotfiles/aliases/"
    # create file
    puts Dir.pwd
      Dir.chdir "coding"
      Dir.chdir "MeadHall"
      Dir.chdir "dotfiles"
      Dir.chdir "aliases"
puts Dir.pwd
Dir.foreach('.'){|e| puts e}

     File.open('.aliases.sh', 'w') do |alias_file|
      alias_file.write(RunAndTell.base_function)
     end

    # init run and tell

  end

  #### INSTANCE METHODS

  def initialize(opts = {})
    @alias_lists = opts[:alias_lists]
    self.class.run
    write_aliases
  end

  def write_aliases
    @alias_lists.each do |list_group|
      list_group.each do |list|
        File.open('.aliases.sh', 'a') do |f|
          f.puts "\n\n"
          f.puts "# Alias List: #{list[:name]}\n"
          f.puts ""
        end

        list[:aliases].each do |alias_name, alias_action|
          File.open('.aliases.sh', 'a') do |f|
            command = RunAndTell.generate_alias(alias_name: alias_name, alias_action: alias_action)
            puts command
            f.puts command
          end
        end
      end
    end
  end
end
