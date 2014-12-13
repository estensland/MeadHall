require_relative 'requirement'

class GameController
  DEFAULT_SETUP = [[[Carrier], ['A4', 'B4', 'C4', 'D4', 'E4']], [[Battleship], ['A7', 'B7', 'C7', 'D7']], [[Cruiser], ['A9', 'B9', 'C9']], [[Submarine], ['A10', 'B10', 'C10']], [[Destroyer], ['A1', 'B1']]]

  def initialize(opts)
    players_setup
  end

  def players_setup
    res = [1,2].map do |i|
      @player1 = player_setup(i)
    end
  end

  def player_setup_questions
  end

  def player_setup(num)
    puts "Player #{num} Setup"
    puts ""

    name = player_name_setup
  end

  def player_name_setup
    puts 'Rock Your Name:'
    name = gets.chomp
  end

    puts '1. Manual setup
          2. Auto Setup'
    name = gets.chomp

    if input
      player_setup
    else
      auto_set_up
    end
  end


    DEFAULT_SETUP.each do |ship, coordinates|
      ship_place(ship, coordinates)
    end
  end

  def player_set_up
    Ship::SHIP_CLASSES.each do |ship|
      puts
    end
  end
end