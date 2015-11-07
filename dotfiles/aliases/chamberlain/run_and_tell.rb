class RunAndTell

  def self.base_function
    <<-eos
# run and tell function runs the alias, but says what the real command was

function run_and_tell(){
  echo
  echo Running: $1
  echo
  eval $1
  echo
}
    eos

  end


  def initialize(opts = {})
    @alias = opts[:alias_name]
    @action = opts[:action]
  end

  def write_to_page

  end
end