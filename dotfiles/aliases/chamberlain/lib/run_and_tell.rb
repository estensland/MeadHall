class RunAndTell

  def self.base_function
    <<-eos
# run and tell function runs the alias, but says what the real command was

function run_and_tell(){
  echo
  echo -e `tput setaf 215` Running: `tput sgr0` $@ | awk '{ gsub(" ruby ", "\033[1;31m&\033[0m"); gsub("rails", "\033[1;31m&\033[0m"); gsub("rake", "\033[1;31m&\033[0m"); gsub("git", "\033[1;32m&\033[0m"); gsub("cd", "\033[1;33m&\033[0m"); gsub("ls", "\033[1;33m&\033[0m"); gsub("subl", "\033[1;30m&\033[0m"); gsub("brew", "\033[1;34m&\033[0m"); gsub("bundle", "\033[1;31m&\033[0m"); print }'
  echo
  eval $@
  echo
}
    eos

  end

  def self.generate_alias(opts = {})
    row = self.new(opts)
    if(opts[:single_input])
      row.run_tell_single_input
    else
      row.run_tell_alias
    end
  end


  def initialize(opts = {})
    @alias  = opts[:alias_name]
    @action = opts[:alias_action]
  end

  def run_tell_alias
    "alias #{@alias}=\"run_and_tell #{@action}\""
  end

  def run_tell_single_input
    "alias #{@alias}=\"run_and_tell '#{@action}'\""
  end
end