require_relative 'requirement'

class Fleet
  attr_accessor :ships

  def initialize(opts={})
    @ships = opts[:ships]
  end

  def add_ship(ship)
    self.ships << ship
  end

  def sunk_ships
    ships.select(&:sunk?)
  end

  def floating_ships
    ships.reject(&:sunk?)
  end
end
