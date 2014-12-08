class Ship
  attr_accessor :player, :type, :status, :cells

  def initialize(opts)
    @player = opts[:player]
    @type = opts[:type]
    @status = opts[:status]
    @cells = opts[:cells]
  end

  def sunk?
    @status == 'sunk'
  end

  def hit(letter, number)
    cells = self.cells.delete([letter, number])
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
    if self.type == 'battleship'
      "You sunk my Battleship!"
    else
      "#{self.player.name}'s #{self.type.capitalize} was sunk!"
    end
  end
end