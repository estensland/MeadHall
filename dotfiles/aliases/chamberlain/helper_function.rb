class HelperFunction

  def self.generate(opts = {})
    self.new(opts).generate_function
  end

  attr_accessor :name, :alias_list, :spacing

  def initialize(opts = {})
    @name  = opts[:name]
    @alias_list = opts[:alias_list] || []
    @spacing = calculate_spacing
  end

  def calculate_spacing
    4
  end

  def generate_function
    <<-eos

function #{name.downcase}-help(){
  echo "#{name.capitalize} Aliases"
  echo
  #{
    alias_list.map do |alias_key, alias_action|
      spacing = ""
      (10 - alias_key.length).times{spacing << ' '}

      "echo \" #{alias_key}#{spacing} = #{alias_action}\""
    end.join("\n\t")
  }
  echo
}
    eos
  end
end
