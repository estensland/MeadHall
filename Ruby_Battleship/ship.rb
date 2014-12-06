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
    cells = cells.delete([letter, number])
    sink_check
  end

  def sink_check
    if @cells.length > 0
      'Hit!'
    else
      status = 'sunk'
      sunk_message
    end
  end

  def sunk_message
    if type == 'battleship'
      "You sunk my Battleship!"
    else
      "#{player.name}'s #{type.capitalize} was sunk!"
    end
  end
end