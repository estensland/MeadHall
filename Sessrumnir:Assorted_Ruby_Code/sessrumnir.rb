module Sessrumnir
  require_relative 'chance_distribution'
  require_relative 'rubymathics'
  require_relative 'statistics_junk'
  require_relative 'string_formatting'

  include StatisticsJunk
  include Rubymathics
  include ChanceDistribution
  include WordPrintOut
end