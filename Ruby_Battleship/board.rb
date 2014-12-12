require_relative 'requirement'

class Board
  def initialize(opts)
    @grid =[[0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0]]
    if opts[:manual_setup]
      player_setup
    else
      auto_set_up
    end
  end

  def auto_set_up
    [[[Carrier], ['A4', 'B4', 'C4', 'D4', 'E4'], [Battleship], ['A7', 'B7', 'C7', 'D7']]]
  end
end