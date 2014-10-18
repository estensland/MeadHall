module ChanceDistribution
  def self.value_of(input, opts)
    opts.each do |key, value|
      if value.is_a?(Range)
        test_value = value.first.is_a?(Integer) ? input.to_i : input.to_s
        return key if value.include?(test_value)
      elsif value.is_a?(Integer)
        return key if value == input.to_i
      elsif value.is_a?(String)
        test_value =  value =~ /^\d+$/ ? value.to_i : input
        return key if value == test_value
      end
    end
  end

  def self.random_value(opts)
    min = opts.values.first.is_a?(Range) ? (opts.values.first.min) : opts.values.first.to_i
    max = opts.values.last.is_a?(Range) ? (opts.values.last.max) : opts.values.last.to_i
    rand_value = rand(min..max)
    value_of(rand_value, opts)
  end
end

# continents =
#   { 'Africa'   => 1..23,
#     'Asia'     => '24'..'80',
#     'Europe'   => 81..85,
#     'Americas' => 86..99,
#     'Oceania'  => 100 }

# p ChanceDistribution.value_of(5, continents)     == 'Africa'
# p ChanceDistribution.value_of('5', continents)   == 'Africa'
# p ChanceDistribution.value_of(24, continents)    == 'Asia'
# p ChanceDistribution.value_of('77', continents)  == 'Asia'
# p ChanceDistribution.value_of(100, continents)   == 'Oceania'
# p ChanceDistribution.value_of('100', continents) == 'Oceania'
# p continents.keys.include?(ChanceDistribution.random_value(continents))