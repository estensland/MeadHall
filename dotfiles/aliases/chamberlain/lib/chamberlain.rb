require 'fileutils'
require 'yaml'

require '~/coding/MeadHall/dotfiles/aliases/chamberlain/lib/run_and_tell.rb'
require '~/coding/MeadHall/dotfiles/aliases/chamberlain/lib/run_and_tell_quoted_inputs.rb'
require '~/coding/MeadHall/dotfiles/aliases/chamberlain/lib/helper_function.rb'
require '~/coding/MeadHall/dotfiles/aliases/chamberlain/lib/custom_function.rb'
require '~/coding/MeadHall/dotfiles/aliases/chamberlain/lib/list_collector.rb'

class Chamberlain

  #### INSTANCE METHODS

  def self.run
    # set path
    path = "/Users/Eric/coding/MeadHall/dotfiles/aliases/"

    FileUtils.cd("#{path}/chamberlain/last_pass/")

    # move files to last_pass
    Dir.entries(".").each do |file|
      next if file == '.' || file == '..' || File.directory?(file)
      FileUtils.rm(file)
    end

    FileUtils.cd(path)
    # move files to last_pass
    Dir.entries(".").each do |file|
      next if file == '.' || file == '..' || File.directory?(file)
      FileUtils.mv(file, "chamberlain/last_pass/#{file}")
    end


    # create file
    File.open('.aliases.sh', 'w') do |alias_file|
      alias_file.write(RunAndTell.base_function)
      alias_file.write("\n\n")
      alias_file.write(RunAndTellQuotedInputs.base_function)
    end
  end

  #### INSTANCE METHODS

  def initialize(opts = {})
    @profile = opts[:profile]
    @option = opts[:options]
    @alias_lists = ListCollector.run(list: @profile)
    self.class.run
    write_aliases
  end

  def write_aliases
    @alias_lists.each do |list|
      File.open('.aliases.sh', 'a') do |f|
        f.puts "\n\n"
        f.puts "# Alias List: #{list[:name]}\n"
        f.puts ""
      end

      arrayed = []

      (list[:aliases] || []).each do |alias_name, alias_action|
        arrayed << [alias_name, alias_action]
        File.open('.aliases.sh', 'a') do |f|
          command = RunAndTell.generate_alias(alias_name: alias_name, alias_action: alias_action)
          print '.'
          f.puts command
        end
      end

      (list[:grepped_aliases] || []).each do |alias_name, alias_action|
        File.open('.aliases.sh', 'a') do |f|
          arrayed << [alias_name, alias_action]
          command = RunAndTell.generate_alias(single_input: true, alias_name: alias_name, alias_action: alias_action)
          print '.'
          f.puts command
        end
      end

      (list[:quoted_inputs] || []).each do |alias_name, alias_action|
        File.open('.aliases.sh', 'a') do |f|
          arrayed << [alias_name, alias_action]
          command = RunAndTellQuotedInputs.generate_alias(alias_name: alias_name, alias_action: alias_action)
          print '.'
          f.puts command
        end
      end

      (list[:custom_functions] || []).each do |function_name, function_hash|
        arrayed << [function_name, function_hash[:helper_descrpition]] if function_hash[:helper_descrpition]
        command = CustomFunction.generate(
          name: function_name,
          echo_description: function_hash[:echo_description],
          command: function_hash[:command]
        )
        File.open('.aliases.sh', 'a') do |f|
          print '.'
          f.puts command
        end
      end

      File.open('.aliases.sh', 'a') do |f|
        f.puts HelperFunction.generate(name: list[:name], alias_list: arrayed)
        f.puts "\n\n\n#########"
      end

    end
  end
end
