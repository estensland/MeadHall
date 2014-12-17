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

  def player_ship_set_up
    Ship::SHIP_CLASSES.each do |ship|

    end
  end

  def default_ship_set_up
    fleet = []

    DEFAULT_SETUP.each do |ship, coordinates|
      ship = ship_place(ship, coordinates)
      fleet << ship
    end

    fleet
  end

  def manual_ship_placing(ship)
    Views::PlayerSetup.ship_intro(ship)
    alignment = Views::PlayerSetup.select_alignment
    Views::PlayerSetup.position_intro(ship)
    vertical = Views::PlayerSetup.select_row
    horizontal = Views::PlayerSetup.select_column
    ship = Views::PlayerSetup.ship_placing(ship)
  end

  def ship_place(ship)
    ship =
  end
end