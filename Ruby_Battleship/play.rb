require_relative 'orig_board'

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