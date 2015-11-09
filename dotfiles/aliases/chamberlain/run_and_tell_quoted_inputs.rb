class RunAndTellQuotedInputs

  def self.base_function
    <<-eos
# run and tell quoted inputs function runs the alias, but keeps extra arguments locked in as a string, like for git commit

function run_and_tell_quoted_inputs(){
  echo
  echo Running: $1 "'${@:2}'"
  echo
  eval $1 "'${@:2}'"
  echo
}
    eos

  end

  def self.generate_alias(opts = {})
    row = self.new(opts)
    return row.run_tell_alias
  end


  def initialize(opts = {})
    @alias  = opts[:alias_name]
    @action = opts[:alias_action]
  end

  def run_tell_alias
    "alias #{@alias}=\"run_and_tell_quoted_inputs '#{@action}'\""
  end
end