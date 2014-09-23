class WeightedDistribution
  def initialize(opts)
    @opts = opts
  end

  def value_of(input)
    @opts.each do |key, value|
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

  def random_value
    rand_value = rand(@opts.values.first.min..@opts.values.last.max)
    self.value_of(rand_value)
  end
end


percent_per_continent = WeightedDistribution.new({
                                                  'Africa' => 1..23,
                                                  'Asia' => '24'..'80',
                                                  'Europe' => 81..85,
                                                  'Americas' => 86..99,
                                                  'Oceania' => 100
                                                })

p percent_per_continent.value_of(5) == 'Africa'
p percent_per_continent.value_of('5') == 'Africa'
p percent_per_continent.value_of(24) == 'Asia'
p percent_per_continent.value_of('77') == 'Asia'
p percent_per_continent.value_of(100) == 'Oceania'
p percent_per_continent.value_of('100') == 'Oceania'
