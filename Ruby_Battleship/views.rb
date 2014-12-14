module Views
  module PlayerSetup
    def name
      puts '----------------'
      puts 'Give Name:'
      puts ' '
      gets.chomp
    end


    def setup_choice
      puts '----------------'
      puts 'Pick Setup:'
      puts '1. Manual'
      puts '2. Auto'
      puts ' '
      gets.chomp
    end
  end
end