class CustomFunction
  def self.generate(opts = {})
    new(opts).output
  end

  attr_reader :command

  def initialize(opts = {})
    @name = opts[:name]
    @echo_description = opts[:echo_description]
    @command = multiline_yaml_parse(opts[:command])
  end

  def multiline_yaml_parse(command_line)
    command_line.gsub(/\n(?!$)/, "\n\s\s")
  end

  def output
    <<-eos


function #{@name}(){
  #{open_echo}

  #{@command}

  echo
  echo
}
    eos

  end

  def open_echo
    if @echo_description
    <<-eos

  echo
  echo -e `tput setaf 215` Running: `tput sgr0` "#{@echo_description}" | awk '{ gsub(" ruby ", "[1;31m&[0m"); gsub("rails ", "[1;31m&[0m"); gsub("rake ", "[1;31m&[0m"); gsub("git ", "[1;32m&[0m"); gsub("cd ", "[1;33m&[0m"); gsub(" ls ", "[1;33m&[0m"); gsub("subl ", "[1;30m&[0m"); gsub("brew ", "[1;34m&[0m"); gsub("bundle ", "[1;31m&[0m"); print }'
  echo
    eos
    else
      "echo"
    end
  end

end
