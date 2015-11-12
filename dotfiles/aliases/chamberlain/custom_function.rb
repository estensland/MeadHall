class CustomFunction
  def self.generate(opts = {})
    new(opts).output
  end

  attr_reader :command

  def initialize(opts = {})
    @name = opts[:name]
    @echo_description = opts[:echo_description]
    @command = opts[:command]
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
  "echo
  echo \"running: #{@echo_description}\"
  echo"
    else
      "echo"
    end
  end

end
