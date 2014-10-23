# Empty = 0
# Sub = 1
# Destroyer = 2
# Cruiser = 3
# BS = 4
# AC = 5
# Hit = 6
# Sunk = 7
# Miss = 8
# ???? = 9

COLORS = {
  red: "\033[1;91m",
  yellow: "\033[1;93m",
  green: "\033[1;92m",
  cyn: "\033[36m",
  blue: "\033[1;94m",
  white: "\033[1;97m",
  color_reset: "\e[0m"
}

p1_blank_board=
[[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0]]

p2_blank_board=
[[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0]]

p1_copy_board=
[[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0]]

p2_copy_board=
[[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0]]

p1_pre_made_board=
[[5,5,5,5,5,0,0,0,0,0],
[0,0,0,0,4,0,0,0,1.1,0],
[0,0,0,0,4,0,0,0,0,0],
[0,0,0,0,4,0,0,1,0,0],
[0,0,0,0,4,0,0,0,0,0],
[0,2.1,2.1,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,3,3,3,0],
[0,0,2,0,0,0,0,0,0,0],
[0,0,2,0,0,0,0,0,0,0]]

p2_pre_made_board=
[[5,5,5,5,5,0,0,0,0,0],
[0,0,0,0,4,0,0,0,1.1,0],
[0,0,0,0,4,0,0,0,0,0],
[0,0,0,0,4,0,0,1,0,0],
[0,0,0,0,4,0,0,0,0,0],
[0,2.1,2.1,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,3,3,3,0],
[0,0,2,0,0,0,0,0,0,0],
[0,0,2,0,0,0,0,0,0,0]]

p1_view =
"P2 A    B    C    D    E    F    G    H    I    J
  +-------------------------------------------------+
1 | A1 | B1 | C1 | D1 | E1 | F1 | G1 | H1 | I1 | J1 |
  |----|----|----|----|----|----|----|----|----|----|
2 | A2 | B2 | C2 | D2 | E2 | F2 | G2 | H2 | I2 | J2 |
  |----|----|----|----|----|----|----|----|----|----|
3 | A3 | B3 | C3 | D3 | E3 | F3 | G3 | H3 | I3 | J3 |
  |----|----|----|----|----|----|----|----|----|----|
4 | A4 | B4 | C4 | D4 | E4 | F4 | G4 | H4 | I4 | J4 |
  |----|----|----|----|----|----|----|----|----|----|
5 | A5 | B5 | C5 | D5 | E5 | F5 | G5 | H5 | I5 | J5 |
  |----|----|----|----|----|----|----|----|----|----|
6 | A6 | B6 | C6 | D6 | E6 | F6 | G6 | H6 | I6 | J6 |
  |----|----|----|----|----|----|----|----|----|----|
7 | A7 | B7 | C7 | D7 | E7 | F7 | G7 | H7 | I7 | J7 |
  |----|----|----|----|----|----|----|----|----|----|
8 | A8 | B8 | C8 | D8 | E8 | F8 | G8 | H8 | I8 | J8 |
  |----|----|----|----|----|----|----|----|----|----|
9 | A9 | B9 | C9 | D9 | E9 | F9 | G9 | H9 | I9 | J9 |
  |----|----|----|----|----|----|----|----|----|----|
10| A10| B10| C10| D10| E10| F10| G10| H10| I10| J10|
  +-------------------------------------------------+ "

p2_view =
"P2 A    B    C    D    E    F    G    H    I    J
  +-------------------------------------------------+
1 | A1 | B1 | C1 | D1 | E1 | F1 | G1 | H1 | I1 | J1 |
  |----|----|----|----|----|----|----|----|----|----|
2 | A2 | B2 | C2 | D2 | E2 | F2 | G2 | H2 | I2 | J2 |
  |----|----|----|----|----|----|----|----|----|----|
3 | A3 | B3 | C3 | D3 | E3 | F3 | G3 | H3 | I3 | J3 |
  |----|----|----|----|----|----|----|----|----|----|
4 | A4 | B4 | C4 | D4 | E4 | F4 | G4 | H4 | I4 | J4 |
  |----|----|----|----|----|----|----|----|----|----|
5 | A5 | B5 | C5 | D5 | E5 | F5 | G5 | H5 | I5 | J5 |
  |----|----|----|----|----|----|----|----|----|----|
6 | A6 | B6 | C6 | D6 | E6 | F6 | G6 | H6 | I6 | J6 |
  |----|----|----|----|----|----|----|----|----|----|
7 | A7 | B7 | C7 | D7 | E7 | F7 | G7 | H7 | I7 | J7 |
  |----|----|----|----|----|----|----|----|----|----|
8 | A8 | B8 | C8 | D8 | E8 | F8 | G8 | H8 | I8 | J8 |
  |----|----|----|----|----|----|----|----|----|----|
9 | A9 | B9 | C9 | D9 | E9 | F9 | G9 | H9 | I9 | J9 |
  |----|----|----|----|----|----|----|----|----|----|
10| A10| B10| C10| D10| E10| F10| G10| H10| I10| J10|
  +-------------------------------------------------+ "


class Board
  attr_accessor :name
  def initialize(name, board, copy, view)
    @name = name
    @board = board
    @copy = copy
    @view = view
    @sub1 = false
    @sub2 = false
    @des1 = false
    @des2 = false
    @cru = false
    @bs = false
    @ac = false
    @submarine1 = 0
    @submarine2 = 0
    @destroyer1 = 0
    @destroyer2 = 0
    @cruiser = 0
    @battleship = 0
    @carrier = 0
  end

  def ship_already_there?(direction, ship, row, column)

    if direction.downcase == "vertical" || direction.downcase == "v"
      count = ship.floor
      while count > 0
        return false if @board[row + (ship-count)][column] != 0
        count -=1
      end
    elsif direction.downcase == "horizontal" || direction.downcase == "h"
      count = ship.floor
      while count > 0
        return false if @board[row][column + (ship-count)] != 0
        count -=1
      end
    end
  end

  def ship_placer(direction, ship, row, column)

    if direction.downcase == "vertical" || direction.downcase == "v"
      count = ship.floor
      while count > 0
        @board[row + (ship-count)][column] = ship
        count -=1
      end
    elsif direction.downcase == "horizontal" || direction.downcase == "h"
      count = ship.floor
      while count > 0
        @board[row][column + (ship-count)] = ship
        count -=1
      end
    end
  end

  def board_creation
    ships = ["Carrier", "Battleship", "Cruiser", "Destroyer 1", "Destroyer 2", "Submarine 1", "Submarine 2"]
    ships_number = [5,4,3,2,2.1,1,1.1]
    ships.each do |ship|
      full_print(@board)
      puts "#{ship} Placement"
      direction = ''
      loop do
        puts "Vertical or Horizontal?"
        direction = gets.chomp
        if direction.downcase == "vertical" || direction.downcase == "horizontal" || direction.downcase == "v" || direction.downcase == "h" 
          break
        end
      end
      input = ''; row = ''; column = ''
      loop do
        puts "Coordinate for bow of your #{ship.downcase}?"
        input = gets.chomp
        input = view_to_board(input)
        row = input[1].to_i
        column = input[0].to_i
        if direction.downcase == "vertical" || direction.downcase == "v"
          if row + ships_number[ships.index(ship)] > 10.2
            puts "INVALID LOCATION for ship"
          elsif ship_already_there?(direction, ships_number[ships.index(ship)], row, column) == false
            puts "INVALID LOCATION for ship, Another is there!"
          else
            break
          end
        elsif direction.downcase == "horizontal" || direction.downcase == "h"
          if column + ships_number[ships.index(ship)] > 10.2
            puts "INVALID LOCATION for ship, Not enough room!"
          elsif ship_already_there?(direction, ships_number[ships.index(ship)], row, column) == false
            puts "INVALID LOCATION for ship, Another is there!"
          else
            break
          end
        end
      end
      ship_placer(direction, ships_number[ships.index(ship)], row, column)
    end
  end

  def attack(input)
    row = input[1].to_i
    column = input[0].to_i
    view_change = board_to_view(row,column)
    if @copy[row][column] == 6 ||@copy[row][column] == 7 || @copy[row][column] == 8
      p "You Shot There! at  #{view_change}"
    elsif @board[row][column] == 1 || @board[row][column] == 1.1 || @board[row][column] == 2.1 || @board[row][column] == 2 || @board[row][column] == 3 || @board[row][column] == 4 || @board[row][column] == 5
      @copy[row][column] = 6
      alter_view(row,column, "#{COLORS[:red]} HIT#{COLORS[:color_reset]}")
      p "HIT! at  #{view_change}"
      @target = view_change
      if @board[row][column] == 1
        @submarine1 += 1
      elsif @board[row][column] == 1.1
        @submarine2 += 1
      elsif @board[row][column] == 2
        @destroyer1 += 1
      elsif @board[row][column] == 2.1
        @destroyer2 += 1
      elsif @board[row][column] == 3
        @cruiser += 1
      elsif @board[row][column] == 4
        @battleship += 1
      elsif @board[row][column] == 5
        @carrier += 1
      end
    elsif @board[row][column] == 0
      p "Miss at #{view_change}"
      @copy[row][column] = 8
        alter_view(row,column, "#{COLORS[:white]}MISS#{COLORS[:color_reset]}")
    end
    sink_check
    view_render
  end

  def sink_check
    if @submarine1 == 1
      unless @copy.flatten.include?(1)
        unless @sub1 == true
          p "First submarine sunk!"
          @sub1 = true
          turn_to_sink(1)
          @submarine1 += 1
        end
      end
    end
    if @submarine2 == 1
      unless @copy.flatten.include?(1.1)
        unless @sub2 == true
          p "Second submarine sunk!"
          @sub2 = true
          turn_to_sink(1.1)
          @submarine2 += 1
        end
      end
    end
    if @destroyer1 == 2
      unless @copy.flatten.include?(2)
        unless @des1 == true
          p "First destroyer sunk!"
          @des1 = true
          turn_to_sink(2)
          @destroyer1 += 1
        end
      end
    end
    if @destroyer2 == 2
      unless @copy.flatten.include?(2.1)
        unless @des2 == true
          p "Second destroyer sunk!"
          @des2 = true
          turn_to_sink(2.1)
          @destroyer2 += 1
        end
      end
    end
    if @cruiser == 3
      unless @copy.flatten.include?(3)
        unless @cru == true
          p "Cruiser Under the Waves!"
          @cru = true
          turn_to_sink(3)
          @cruiser += 1
        end
      end
    end
    if @battleship == 4
      unless @copy.flatten.include?(4)
        unless @bs == true
          p "You Sunk My Battleship!"
          @bs = true
          turn_to_sink(4)
          @battleship += 1
        end
      end
    end
    if @carrier == 5
      unless @copy.flatten.include?(5)
        unless @ac == true
          p "Aircraft Carrier Be Down At Davy Jone's Locker!"
          @ac = true
          turn_to_sink(5)
          @carrier += 1
        end
      end
    end
    if @sub1 == true && @sub2 == true && @des1 == true && @des2 == true && @cru == true && @bs == true && @ac == true
      puts "\n\n\n\n\n\n\n\n\n  All ships have been sunk, this battle is finished \n\n\n\n\n\n\n\n\n\n\n"
      exec('echo Game Complete')
    end
  end

  def turn_to_sink(ship)
    row = 0
    while row < 10
      column = 0
      while column < 10
        if @board[row][column] == ship
          view_change = board_to_view(row,column)
          @copy[row][column] = 7
          alter_view(row,column,"#{COLORS[:blue]}SUNK#{COLORS[:color_reset]}", true)
        end
        column +=1
      end
    row +=1
    end
  end

  def full_print input
    input.each do |x|
      p x
    end
  end

  def cheat
    @board.each do |x|
      p x
    end
  end

  def setup
    row = 0
    while row < 10
      column = 0
      while column < 10
        if @board[row][column] == 0 || @board[row][column] == 1 || @board[row][column] == 1.1 || @board[row][column] == 2.1 || @board[row][column] == 2 || @board[row][column] == 3 || @board[row][column] == 4 || @board[row][column] == 5
          @copy[row][column] = 9
        end
        if @board[row][column] == 6
          @copy[row][column] = 6
        end
        if @board[row][column] == 7
          @copy[row][column] = 7
        end
        if @board[row][column] == 8
          @copy[row][column] = 8
        end
        column +=1
      end
    row +=1
    end
  end

  def board_to_view(row, column)
    letters = ("A".."J").to_a
    row +=1
    column = letters[column]
    return "#{column}#{row}"
  end

  def view_to_board(string)
    input = []
    input = string.split('')
    letters = ("A".."J").to_a
    input[0] = letters.index(input[0])
    if input [2] == "0"
      input[1] = 9
    else
      input[1] = input[1].to_i -  1
    end
    return input
  end

  def view_render
    puts @view
    puts ships_sunk
  end

  def prep_screen
    self.clear_screen!
    self.move_to_home!
  end

  def clear_screen!
    print "\e[2J"
  end
   
  # Moves cursor to the top left of the terminal
  def move_to_home!
    print "\e[H"
  end

  def ships_sunk
    at_least_one = false
    sunken = ''
    puts "- - - - - SHIPS SUNK: - - - - -"
    {'Aircraft Carrier' => @ac,  'Battleship' => @bs,  'Cruiser' => @cru,  'Destroyer 1' => @des1, 'Destroyer 2' => @des2, 'Submarine 1' => @sub1, 'Submarine 2' => @sub2 }.each do |ship, check|
      if check
        if sunken.length > 1
          sunken << " | "
        end
        at_least_one = true
        sunken << "#{COLORS[:red]}#{ship}#{COLORS[:color_reset]}"
      end
    end
    puts at_least_one ? sunken : "NONE"
    puts "- - - - - - - - - - - - - - - -"
  end

  def alter_view(row, column, text, sunk = nil)
    counter = (row) * 22 + column + 1
    character = 0
    while counter > 0
      if @view[character] == "|"
        counter -= 1
      end
      character += 1
    end

    spaces = sunk ? 15 : 4
    spaces.times {@view[character] = ''}

    @view.insert(character, text)
  end

  def skynet_protocol_search(input)
    if input == "hits"
      hits = []
      row = 0
      while row < 10
        column = 0
        while column < 10
          if @copy[row][column] == 6
            hits << "#{row}#{column}"
          end
          column +=1
        end
        row +=1
      end
      return hits
    elsif input == "misses"
      misses = []
      row = 0
      while row < 10
        column = 0
        while column < 10
          if @copy[row][column] == 8
            misses << "#{row}#{column}"
          end
          column +=1
        end
        row +=1
      end
      return misses
    end
  end

  def skynet_protocol_neighboring_miss_direction(row, column)
    if (column + 1) < 10 &&  @copy[row][column + 1] == 8
      return false
    end
    if  (column - 1) > -1 && @copy[row][column - 1] == 8
      return false
    end
    if  (row + 1) < 10 && @copy[row + 1][column] == 8
      return false
    end
    if  (row - 1) > -1 && @copy[row - 1][column] == 8
      return false
    end
    return true
  end

  def skynet_protocol_proximity_analysis(input, hits)
    if input == "hits"
      skynet_targets = []
      hits.each do |x|
        row = x[0].to_i
        column = x[1].to_i
        if  @copy[row][column] == 6
          if  (row + 2) < 10 && @copy[row + 1][column] == 6
            if  (row + 2) < 10 && @copy[row + 2][column] == 9
              skynet_targets << ("#{row + 2}#{column}").to_i
              skynet_targets << ("#{row + 2}#{column}").to_i
              skynet_targets << ("#{row + 2}#{column}").to_i
            else
              if (row + 2) < 10 && @copy[row + 2][column] == 6
                skynet_targets << ("#{row + 3}#{column}").to_i if  @copy[row + 3][column] == 9
                skynet_targets << ("#{row + 3}#{column}").to_i if  @copy[row + 3][column] == 9
                skynet_targets << ("#{row + 3}#{column}").to_i if  @copy[row + 3][column] == 9
              end
            end
          end

          if (row - 1) > -1 && @copy[row - 1][column] == 6
            if  (row - 2) > -1 && @copy[row - 2][column] == 9
              skynet_targets << ("#{row - 2}#{column}").to_i
              skynet_targets << ("#{row - 2}#{column}").to_i
              skynet_targets << ("#{row - 2}#{column}").to_i
             else
              if (row - 2) > -1 && @copy[row - 2][column] == 6
                skynet_targets << ("#{row - 3}#{column}").to_i if  @copy[row - 3][column] == 9
                skynet_targets << ("#{row - 3}#{column}").to_i if  @copy[row - 3][column] == 9
                skynet_targets << ("#{row - 3}#{column}").to_i if  @copy[row - 3][column] == 9
              end
            end
          end
          if (column - 1) > -1 && @copy[row][column - 1] == 6
            if  (column - 2) > -1 && @copy[row][column - 2] == 9
              p "Along we go #{@copy[row][column-2]} row #{row} col #{column-2}"

              skynet_targets << ("#{row}#{column - 2}").to_i
              skynet_targets << ("#{row}#{column - 2}").to_i
              skynet_targets << ("#{row}#{column - 2}").to_i
            else
              if (column - 2) > -1 && @copy[row][column - 2] == 6
                if  (column - 3) > -1 && @copy[row][column - 3] == 9
                  skynet_targets << ("#{row}#{column - 3}").to_i
                  skynet_targets << ("#{row}#{column - 3}").to_i
                  skynet_targets << ("#{row}#{column - 3}").to_i
                end
              end
            end
          end

          if  (column + 1) > 10 && @copy[row][column + 1] == 6
            if  (column + 2) > 10 && @copy[row][column + 2] == 9
              skynet_targets << ("#{row}#{column + 2}").to_i
              skynet_targets << ("#{row}#{column + 2}").to_i
              skynet_targets << ("#{row}#{column + 2}").to_i
            else
              if  (column + 2) > 10 && @copy[row][column + 2] == 9
                if  (column + 3) < 10 && @copy[row][column + 3] == 9
                  skynet_targets << ("#{row}#{column + 3}").to_i
                  skynet_targets << ("#{row}#{column + 3}").to_i
                  skynet_targets << ("#{row}#{column + 3}").to_i
                end
              end
            end
          end

          if   (column + 1)  < 10 && @copy[row][column + 1] == 9
            skynet_targets << ("#{row}#{column + 1}").to_i
          end
          if   (column - 1 )  > -1 && @copy[row][column - 1] == 9
            skynet_targets << ("#{row}#{column - 1}").to_i
          end
          if   (row + 1)  < 10 && @copy[row + 1][column] == 9
            skynet_targets << ("#{row + 1}#{column}").to_i
          end
          if   (row - 1)  > -1 && @copy[row - 1][column] == 9
            skynet_targets << ("#{row - 1}#{column}").to_i
          end
        end
      end
    elsif input == "misses"
      skynet_targets = []
      if hits.empty?
        x = 0
        until x == 500
          row = rand(9).to_i
          column = rand(9).to_i
          break if @copy[row][column] == 9
          rand(9).to_s
          x += 1
        end
        skynet_targets << ("#{row}#{column}").to_i
      else
        hits.each do |x|
          row = x[0].to_i
          column = x[1].to_i
          if  (row + 1) < 10 && (column + 1 ) < 10 && skynet_protocol_neighboring_miss_direction(row, column) && @copy[row + 1][column + 1] == 9 
            skynet_targets << ("#{row + 1}#{column + 1}").to_i
          end
          if  (row - 1) > -1 && (column - 1 ) > -1 && skynet_protocol_neighboring_miss_direction(row, column) && @copy[row - 1][column - 1] == 9 
            skynet_targets << ("#{row - 1}#{column - 1}").to_i
          end
          if  (row + 1) < 10 && (column - 1 ) > -1 && skynet_protocol_neighboring_miss_direction(row, column) && @copy[row + 1][column - 1] == 9 
            skynet_targets << ("#{row + 1}#{column - 1}").to_i
          end
          if  (row - 1) > -1 && (column + 1 ) < 10 && skynet_protocol_neighboring_miss_direction(row, column) && @copy[row - 1][column + 1] == 9 
            skynet_targets << ("#{row - 1}#{column + 1}").to_i
          end
        end
      end
    end
    return skynet_targets
  end

  def mode(array)
    counter = Hash.new(0)

    array.each do |i|
        counter[i] += 1
    end

    mode_array = []

    counter.each do |k, v|
      if v == counter.values.max
        mode_array << k
      end
    end

    if mode_array.length != 0
      return mode_array.sample
    else
      return mode_array
    end
  end


  def skynet_protocol_alpha
    if @copy.flatten.include?(6)
      skynet_targets = skynet_protocol_proximity_analysis("hits", skynet_protocol_search("hits"))
      skynet_targets = mode(skynet_targets)
      row = skynet_targets/10
      column = skynet_targets%10
    elsif @copy.flatten.include?(8)
      skynet_targets = skynet_protocol_proximity_analysis("misses", skynet_protocol_search("misses"))
      skynet_targets = mode(skynet_targets)
      if skynet_targets == ""
        x = 0
        until x == 500
          row = rand(9).to_i
          column = rand(9).to_i
          break if @copy[row][column] == 9
          x += 1
        end
      else
        if skynet_targets == []
          x = 0
          until x == 500
            row = rand(9).to_i
            column = rand(9).to_i
            break if @copy[row][column] == 9
            x += 1
          end
        else
          row = skynet_targets/10
          column = skynet_targets%10
        end
      end
    elsif @copy.flatten.include?(9)
      x = 0
      until x == 500
        row = rand(9).to_i
        column = rand(9).to_i
        break if @copy[row][column] == 9
        x += 1
      end
    end
    strike_grid_coordinate = []
    strike_grid_coordinate[0] = column
    strike_grid_coordinate[1] = row
    attack(strike_grid_coordinate)
  end

  def skynet_protocol_board_build
    ships = ["Carrier", "Battleship", "Cruiser", "Destroyer 1", "Destroyer 2", "Submarine 1", "Submarine 2"]
    ships_number = [5,4,3,2,2.1,1,1.1]
    ships.each do |ship|
      full_print(@copy)
      puts "#{ship} Placement"
      x = 0
      until x == 100
        direction_array = ["v","h"]
        direction = direction_array.sample
        if direction.downcase == "vertical" || direction.downcase == "horizontal" || direction.downcase == "v" || direction.downcase == "h" 
          break
        end
      end
      until x == 100
        row = rand(10)
        column = rand(10)
        if direction.downcase == "vertical" || direction.downcase == "v"
          if row + ships_number[ships.index(ship)] > 10
            puts "INVALID LOCATION for ship"
          elsif ship_already_there?(direction, ships_number[ships.index(ship)], row, column) == false
            puts "INVALID LOCATION for ship, Another is there!"
          else
            break
          end
        elsif direction.downcase == "horizontal" || direction.downcase == "h"
          if column + ships_number[ships.index(ship)] > 10
            puts "INVALID LOCATION for ship, Not enough room!"
          elsif ship_already_there?(direction, ships_number[ships.index(ship)], row, column) == false
            puts "INVALID LOCATION for ship, Another is there!"
          else
            break
          end
        end
      end
      ship_placer(direction, ships_number[ships.index(ship)], row, column)
    end
  end

  def bombardment(times)
    p "BOMBARDMENT!"
    until times == 0
      skynet_protocol_alpha
      p "BOMBARDMENT CONTINUES!"
      gets.chomp
      times -=1
    end
   p "BOMBARDMENT OVER!"
  end
end

captains = ["Kirk", "Nemo", "Ahab", "Morgan", "Long John Silvers", "Underwear", "Kangaroo", "Crunch", "Hook", "America", "Planet", "Thrace", "Adama", "Reynolds", "Jack Sparrow", "Barbossa"]

p "---BATTLESHIP---"
x = 0
until x > 100
  p "Player one: Human (h) or Computer (c)?"
  p1 = gets.chomp
  if p1 == "h" || p1 == "c"
    break
  end
end

x = 0
until x > 100
  p "Player two: Human (h) or Computer (c)?"
  p2 = gets.chomp
  if p2 == "h" || p2 == "c"
    break
  end
end

if p1 == "h"

  p "First Player, Name?"
  p1_name = "Captain " + gets.chomp

  puts "Board set up...make sure other player cannot see! Press ENTER"
  gets.chomp

  player1 = Board.new(p1_name, p1_blank_board, p1_copy_board, p1_view)

  player1.board_creation

  player1.setup

  puts "\n" * 60

elsif p1 == "c"

  p "Player one will be:"
  p1_name = "Captain " + captains.sample

  puts "Board set up for " + p1_name + " You can still quit of course, but press ENTER to go on"
  gets.chomp

  player1 = Board.new(p1_name, p1_blank_board, p1_copy_board, p1_view)

  player1.skynet_protocol_board_build

  player1.setup

  puts "\n" * 60
end

if p2 == "h"

  p "Second Player, Name?"
  p2_name = "Captain " + gets.chomp

  puts "Board set up...make sure other player cannot see! Press ENTER"
  gets.chomp

  player2 = Board.new(p2_name, p2_blank_board, p2_copy_board, p2_view)

  player2.board_creation

  player2.setup

elsif p2 == "c"

  p "Player two will be:"
  p2_name = "Captain " + captains.sample

  puts "Board set up for " + p2_name + " You can still quit, Press ENTER to go on"
  gets.chomp

  player2 = Board.new(p2_name, p2_blank_board, p2_copy_board, p2_view)

  player2.skynet_protocol_board_build

  player2.setup
end


if p1 == "h" && p2 == "h"
  x = 0
  while x < 200
    player2.view_render
    puts "Where To Strike #{player1.name}?"
    input = gets.chomp
    if input == ""
      puts "That was empty...One WARNING! Where To Strike #{player1.name}?"
      input = gets.chomp
    end
    x += 5000 if input == "q"
    if input == "THE ROCK IS COMING DOWN ON US!"
      p "30,000?"
      times = gets.chomp
      player2.bombardment(times.to_i)
      p "FUWAHAHAHAHAHA one more"
      input = gets.chomp
      input = gets.chomp
    end
    player2.view_render
    input = player2.view_to_board(input)
    player2.attack(input)

    p "ENTER WHEN DONE"
    gets.chomp
    player1.prep_screen

    p "ENTER WHEN READY"
    gets.chomp
    player1.prep_screen

    player1.view_render
    puts "Where To Strike #{player2.name}?"
    input = gets.chomp
    if input == ""
      puts "That was empty...One WARNING! Where To Strike #{player1.name}?"
      input = gets.chomp
    end
    x += 5000 if input == "q"
    if input == "THE ROCK IS COMING DOWN ON US!"
      p "30,000?"
      times = gets.chomp
      player2.bombardment(times.to_i)
      p "FUWAHAHAHAHAHA one more"
      input = gets.chomp
    end
    input = player1.view_to_board(input)
    player1.attack(input)
    p "ENTER FOR TURN SWITCH"
    gets.chomp
    x += 1
  end

elsif p1 == "h" && p2 == "c"
  x = 0
  while x < 200
    player2.prep_screen
    player2.view_render
    puts "Where To Strike #{player1.name}?"
    input = gets.chomp
    if input == ""
      puts "That was empty...One WARNING! Where To Strike #{player1.name}?"
      input = gets.chomp
    end
    x += 5000 if input == "q"
    if input == "THE ROCK IS COMING DOWN ON US!"
      p "30,000?"
      times = gets.chomp
      player2.bombardment(times.to_i)
      p "FUWAHAHAHAHAHA one more"
      input = gets.chomp
    end
    player2.view_render
    input = player2.view_to_board(input)
    player2.attack(input)

    p "ENTER FOR TURN SWITCH"
    gets.chomp

    player2.prep_screen
    player1.view_render
    puts "#{player2.name} is ready, ENTER to see"
    input = gets.chomp
    player2.prep_screen
    x += 5000 if input == "q"
    player1.skynet_protocol_alpha
    p "ENTER FOR TURN SWITCH"
    gets.chomp
    x += 1
  end

elsif p1 == "c" && p2 == "h"
  x = 0
  while x < 200
    player2.prep_screen
    player2.view_render
    puts "#{player1.name} is ready, ENTER to see"
    player2.prep_screen
    input = gets.chomp
    x += 5000 if input == "q"
    player2.skynet_protocol_alpha

    p "ENTER FOR TURN SWITCH"
    gets.chomp

    player2.prep_screen
    player1.view_render
    puts "Where To Strike #{player2.name}?"
    input = gets.chomp
    x += 5000 if input == "q"
    input = player1.view_to_board(input)
    player1.attack(input)
    p "ENTER FOR TURN SWITCH"
    gets.chomp
    x += 1
  end

elsif p1 == "c" && p2 == "c"
  x = 0
  while x < 200
    player2.prep_screen
    player2.view_render
    puts "#{player1.name} is ready, ENTER to see"
    input = gets.chomp
    player2.prep_screen
    x += 5000 if input == "q"
    player2.skynet_protocol_alpha

    p "ENTER FOR TURN SWITCH"
    gets.chomp

    player2.prep_screen
    player1.view_render
    puts "#{player2.name} is ready, ENTER to see"
    input = gets.chomp
    player2.prep_screen
    x += 5000 if input == "q"
    player1.skynet_protocol_alpha
    p "ENTER FOR TURN SWITCH"
    gets.chomp
    x += 1
  end
end