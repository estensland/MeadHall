module Views
  module PlayerSetup
    def name
      puts '----------------'
      puts 'Give Name:'
      puts ' '
      gets.chomp
    end

    def blank_line
      puts ' '
    end

    def setup_choice
      puts '----------------'
      puts 'Pick Setup:'
      puts '1. Manual'
      puts '2. Auto'
      blank_line
      gets.chomp
    end

    def ship_intro(ship)
      puts '----------------'
      puts "Place #{ship.to_s} :"
      puts 'Select Coordinates for bow of the ship'
      blank_line
    end

    def select_row
      blank_line
      puts "Pick Row (A-J):"
      blank_line
      gets.chomp
    end

    def select_column
      blank_line
      puts "Pick Row (1-10):"
      blank_line
      gets.chomp
    end
  end
end