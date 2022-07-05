require 'fileutils'
require 'yaml'

require '~/coding/MeadHall/dotfiles/aliases/chamberlain/lib/custom_function.rb'
require '~/coding/MeadHall/dotfiles/aliases/chamberlain/lib/helper_function.rb'
require '~/coding/MeadHall/dotfiles/aliases/chamberlain/lib/list_collector.rb'
require '~/coding/MeadHall/dotfiles/aliases/chamberlain/lib/rspec_helper_function.rb'
require '~/coding/MeadHall/dotfiles/aliases/chamberlain/lib/run_and_tell.rb'
require '~/coding/MeadHall/dotfiles/aliases/chamberlain/lib/run_and_tell_quoted_inputs.rb'

class Chamberlain

  #### INSTANCE METHODS

  def self.directory_path
    "/Users/ericstensland/coding/MeadHall/dotfiles/aliases/"
  end

  def self.run
    self.clear_and_move_files_to_last_pass
    self.set_base_methods
  end

  def self.clear_and_move_files_to_last_pass
    self.clear_last_pass
    self.move_to_last_pass
  end

  def self.clear_last_pass
    self.change_directory_to_last_pass
    remove_files_in_directory('.')
  end

  def self.remove_files_in_directory(dir)
    self.files_in_directory(dir).each do |file|
      next if non_applicable(file)
      remove_file(file)
    end
  end

  def self.files_in_directory(dir)
    Dir.entries(dir)
  end

  def self.non_applicable(file)
    self.dotfile?(file) || File.directory?(file)
  end

  def self.dotfile?(file)
    file == '.' || file == '..'
  end

  def self.remove_file(file)
    FileUtils.rm(file)
  end

  def self.change_directory_to_last_pass
    FileUtils.cd(self.last_pass_directory)
  end

  def self.last_pass_directory
    "#{directory_path}/chamberlain/last_pass/"
  end

  def self.change_directory_to_directory_pass
    FileUtils.cd(directory_path)
  end

  def self.move_to_last_pass
    self.change_directory_to_directory_pass
    self.move_files_to_last_pass('.')
  end

  def self.move_files_to_last_pass(from)
    Dir.entries(from).each do |file|
      next if self.non_applicable(file)
      self.move_file_to_last_pass(file)
    end
  end

  def self.move_file_to_last_pass(file)
    FileUtils.mv(file, self.move_to_location(file))
  end

  def self.move_to_location(file)
    "chamberlain/last_pass/#{file}"
  end

  def self.set_base_methods
    File.open(*self.alias_file_args) do |alias_file|
      self.write_run_and_tell_base_function(alias_file)
      self.write_new_lines(alias_file)
      self.write_run_tell_quoted_base_function(alias_file)
    end
  end

  def self.alias_file_args
    ['.aliases.sh', 'w']
  end

  def self.write_run_and_tell_base_function(alias_file)
    alias_file.write(RunAndTell.base_function)
  end

  def self.write_new_lines(alias_file)
    alias_file.write("\n\n")
  end

  def self.write_run_tell_quoted_base_function(alias_file)
    alias_file.write(RunAndTellQuotedInputs.base_function)
  end



  #### INSTANCE METHODS


  def initialize(opts = {})
    @profile = opts[:profile]
    @option = opts[:options]
    @alias_lists = run_list_collector(opts[:profile])
    self.class.run
    write_aliases
  end

  def run_list_collector(given_profile)
    ListCollector.run(list: given_profile)
  end

  def write_aliases
    echo_tput_setaf
    @alias_lists.each do |list|
      File.open('.aliases.sh', 'a') do |f|
        put_alias_list(f, list)
      end

      arrayed = []

      (list[:aliases] || []).each do |alias_name, alias_action|
        arrayed << [alias_name, alias_action]
        File.open('.aliases.sh', 'a') do |f|
          command = RunAndTell.generate_alias(alias_name: alias_name, alias_action: alias_action)
          put_out_command(f, command)
        end
      end

      (list[:grepped_aliases] || []).each do |alias_name, alias_action|
        File.open('.aliases.sh', 'a') do |f|
          arrayed << [alias_name, alias_action]
          command = RunAndTell.generate_alias(single_input: true, alias_name: alias_name, alias_action: alias_action)
          put_out_command(f, command)
        end
      end

      (list[:quoted_inputs] || []).each do |alias_name, alias_action|
        File.open('.aliases.sh', 'a') do |f|
          arrayed << [alias_name, alias_action]
          command = RunAndTellQuotedInputs.generate_alias(alias_name: alias_name, alias_action: alias_action)
          put_out_command(f, command)
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
          put_out_command(f, command)
        end
      end

      (list[:rspec_helper_functions] || []).each do |function_name, function_hash|
        arrayed << [function_name, function_hash[:helper_descrpition]] if function_hash[:helper_descrpition]
        command = RspecHelperFunction.generate(
          name: function_name,
          class: function_hash[:class],
          plural_class: function_hash[:plural_class],
          file_suffix: function_hash[:file_suffix]
        )
        File.open('.aliases.sh', 'a') do |f|
          put_out_command(f, command)
        end
      end

      File.open('.aliases.sh', 'a') do |f|
        f.puts HelperFunction.generate(name: list[:name], alias_list: arrayed)
        f.puts "\n\n\n#########"
      end

    end
    echo_tput_sgr8
  end

  def echo_tput_setaf
    system "echo `tput setaf 2`"
  end

  def echo_tput_sgr8
    system "echo `tput sgr0`"
  end

  def put_alias_list(f, list)
    f.puts "\n\n"
    f.puts "# Alias List: #{list[:name]}\n"
    f.puts ""
  end

  def put_out_command(f, command)
    print_dot
    f.puts command
  end

  def print_dot
    print '.'
  end
end
