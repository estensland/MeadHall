require_relative 'requirement'

class Player

  def initialize(opts = {})
    @name = opts[:name]
    @fleet = gen_fleet
  end

  def gen_fleet
    Ship::SHIP_CLASSES
    @fleet
  end

end
