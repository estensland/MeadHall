class RspecHelperFunction
  attr_accessor :name, :singular, :pluralized, :file_suffix

  def self.generate(opts = {})
    new(opts).output
  end

  def initialize(opts = {})
    @name = opts[:name]
    @singular = opts[:class]
    @pluralized = opts[:plural_class]
    @file_suffix = set_file_suffix(opts[:file_suffix])
  end

  def output
    CustomFunction.generate(
      name: name,
      echo_description: echo_description,
      command: command
    )
  end

  def echo_description
    "rspec test #{singular} (\$1) line (\$2)"
  end

  def set_file_suffix(input)
    input ? "_#{input}" : ''
  end

  def command
    <<-eos
if [ $# -gt 1 ]; then
  echo testing line $2 in $1 #{singular}
  echo "rspec spec/#{pluralized}/$1#{file_suffix}_spec.rb:$2;"
  rspec spec/#{pluralized}/$1#{file_suffix}_spec.rb:$2;
elif [ $# -gt 0 ]; then
  echo testing all of $1 #{singular}
  echo "rspec spec/#{pluralized}/$1#{file_suffix}_spec.rb;"
  rspec spec/#{pluralized}/$1#{file_suffix}_spec.rb;
else
  echo testing all of #{pluralized}
  echo "rspec spec/#{pluralized}/;"
  rspec spec/#{pluralized}/;
fi
    eos
  end
end
