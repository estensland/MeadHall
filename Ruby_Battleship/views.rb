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
      blank_line
      puts "--------------------"
      puts "Placing #{ship.to_s} :"
      blank_line
    end

    def select_alignment
      blank_line
      puts "Pick Alignment For Ship:"
      puts "Horizontal or Vetical? ('h' or 'v'):"
      blank_line
      gets.chomp
    end

    def coordinates_intro(ship)
      blank_line
      puts "Place #{ship.to_s} :"
      puts 'Select Coordinates for Bow of the Ship'
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