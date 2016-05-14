module Sessrumnir
  require_relative 'chance_distribution'
  require_relative 'rubymathics'
  require_relative 'array_helpers'
  require_relative 'SSN'
  require_relative 'statistics_junk'
  require_relative 'string_formatting'

  include StatisticsJunk
  include Rubymathics
  include ArrayHelpers
  include SSN
  include ChanceDistribution
  include StringFormatting
end
