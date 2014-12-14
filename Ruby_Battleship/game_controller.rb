require_relative 'requirement'

class GameController
  DEFAULT_SETUP = [[[Carrier], ['A4', 'B4', 'C4', 'D4', 'E4']], [[Battleship], ['A7', 'B7', 'C7', 'D7']], [[Cruiser], ['A9', 'B9', 'C9']], [[Submarine], ['A10', 'B10', 'C10']], [[Destroyer], ['A1', 'B1']]]

  def initialize(opts)
    players_setup
  end

  def players_setup
    @player1 = player_setup
    @player2 = player_setup
  end

  def player_setup_questions

  end

  def player_setup(num)
    name = Views::PlayerSetup.name
    fleet = fleet_setup
    Player.new(name: name, fleet: fleet)
  end

  def fleet_setup
    setup_choice = Views::PlayerSetup.setup_choice

    if setup_choice.to_i == 1
      player_set_up
    else
      default_set_up
    end
  end

  def player_set_up
    Ship::SHIP_CLASSES.each do |ship|

    end
  end

  def default_set_up
    fleet = []
    DEFAULT_SETUP.each do |ship, coordinates|
      ship = ship_place(ship, coordinates)
      fleet << ship
    end
  end

  def ship_place(ship)

  end
end