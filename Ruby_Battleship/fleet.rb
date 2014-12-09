class Fleet
  attr_accessor :ships
  
  def initialize(opts={})
    @ships = opts[:ships]
  end
  
  def sunk_ships
    ships.select(&:sunk?)
  end
  
  def floating_ships
    ships.reject(&:sunk?)
  end
end
