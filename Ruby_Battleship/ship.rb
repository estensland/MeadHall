require_relative 'requirement'

class Ship
  SHIP_CLASSES = [Carrier, Battleship, Cruiser, Submarine, Destroyer]
  attr_accessor :player, :type, :status, :cells

  def initialize(opts)
    @player = opts[:player]
    @type = self.class
    @status = opts[:status]
    @cells = opts[:cells]
  end

  def sunk?
    @status == 'sunk'
  end

  def hit(letter, number)
    self.cells = self.cells.delete([letter, number])
    sink_check
  end

  def sink_check
    if @cells.length > 0
      'Hit!'
    else
      self.status = 'sunk'
      sunk_message
    end
  end

  def sunk_message
    if self.class == Battleship
      "You sunk my Battleship!"
    elsif self.class == Carrier
      "#{self.player}'s carrier is at Davy Jones' locker!"
    elsif self.class == Cruiser
      "#{self.player}'s cruiser is under the waves!"
    elsif self.class == Submarine
      "#{self.player}'s submarine is bottomed out!"
    elsif self.class == Destroyer
      "#{self.player}'s destoryer is destoryed!"
    else
      "#{self.player.name}'s #{self.type.capitalize} was sunk!"
    end
  end
end