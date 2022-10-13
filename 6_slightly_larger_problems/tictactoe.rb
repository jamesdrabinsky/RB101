require 'pry'
require 'yaml'
MESSAGES = YAML.load_file('./ttt.yml')

INITIAL_MARKER =  ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],  # rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9],  # columns
  [1, 5, 9], [3, 5, 7]              # diagonals
]

def prompt(msg)
  puts "=> #{msg}"
end

def clear(time = 1)
  sleep(time)
  system('clear')
end

def valid_choice?(choice, *options)
  options.include?(choice)
end

def valid_name?(name)
  name.match?(/^[A-Za-z]/)
end

def welcome
  clear
  prompt MESSAGES['intro_msg']
  name = ''
  loop do
    name = gets.chomp.strip
    if valid_name?(name)
      prompt format(MESSAGES['name']['post_msg'], { player: name })
      break
    end
    prompt MESSAGES['name']['error_msg']
    clear
  end
  name
end

def winning_lines_list(dimension)
  size = dimension**2
  rows = [*(1..size).each_slice(dimension)]
  cols = rows.transpose
  diagonals = [rows, rows.map(&:reverse)].map do |arr|
    arr.map.with_index { |sub_arr, idx| sub_arr[idx] }
  end
  [rows, cols, diagonals]
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  clear(1)
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  # Add message for player here
  puts ""
  puts " 1    | 2      | 3"
  puts "   #{brd[1]}  |    #{brd[2]}   |  #{brd[3]}"
  puts "      |        |"
  puts "------+--------+------"
  puts " 4    | 5      | 6"
  puts "   #{brd[4]}  |    #{brd[5]}   |  #{brd[6]}"
  puts "      |        |"
  puts "------+--------+------"
  puts " 7    | 8      | 9"
  puts "   #{brd[7]}  |    #{brd[8]}   |  #{brd[9]}"
  puts "      |        |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  (1..9).zip([INITIAL_MARKER] * 9).to_h
end

def empty_squares(brd)
  brd.keys.select { |k| brd[k] == INITIAL_MARKER }
end

def joinor(arr, sep1 = ', ', sep2 = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr[0]
  else "#{arr[0..-2].join(sep1)} #{sep2} #{arr[-1]}" 
  end
end

def first_move_decision(name)
  clear
  decider = ''
  loop do
    prompt format(MESSAGES['first_move_decision']['intro_msg'],
                  { player_letter: name[0].downcase, player_name: name })
    decider = gets.chomp.strip.downcase
    break if valid_choice?(decider, name[0], 'c')
    prompt MESSAGES['first_move_decision']['error_msg']
    clear
  end
  decider
end

def first_move(decider, name)
  clear
  first_move = ''
  loop do
    if decider == name[0]
      prompt format(MESSAGES['first_move']['intro_msg'],
                    { player_letter: name[0].downcase, player_name: name })
      first_move = gets.chomp.strip.downcase
    else
      first_move = [name[0], 'computer'].sample
      first_move == name[0] ? MESSAGES['first_move']['player'] : MESSAGES['first_move']['computer']
    end
    break if valid_choice?(first_move, name[0], 'c')
    prompt MESSAGES['first_move']['error_msg']
    clear
  end
  first_move
end

def player_places_piece!(brd) # Destructive method
  square = ''
  loop do
    prompt "Choose a square:  #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    puts "Sorry.  That's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def find_computer_square(brd, marker)
  line = WINNING_LINES.find do |ln|
    line_values = brd.values_at(*ln)
    line_values.count(marker) == 2 && 
      line_values.count(INITIAL_MARKER) == 1
  end
  line.find { |num| brd[num] == INITIAL_MARKER } if line
end

def find_computer_strategy(brd)
  attack_square = find_computer_square(brd, COMPUTER_MARKER)
  return attack_square if attack_square
  defend_square = find_computer_square(brd, PLAYER_MARKER)
  return defend_square if defend_square
  return 5 if empty_squares(brd).include?(5)
  empty_squares(brd).sample
end

def computer_places_piece!(brd)
  square = find_computer_strategy(brd)
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, current_player)
  sleep(1)
  if current_player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  current_player == 'player' ? 'computer' : 'player'
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def add_win(winner, hsh)
  hsh[winner] += 1
end

def game_flow(brd, name)
  decider = first_move_decision(name)
  current_player = first_move(decider, name)
  loop do
    display_board(brd)
    place_piece!(brd, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(brd) || board_full?(brd)
  end
end

def game_end(brd, hsh)
  if someone_won?(brd)
    winner = detect_winner(brd)
    prompt "#{winner} won!"
    add_win(winner, hsh)
    puts hsh.inspect
  else
    prompt "it's a tie!"
  end
  winner
end

def play_again
  again = ''
  loop do
    prompt 'Play again? (y or n)'
    again = gets.chomp.strip
    break if valid_choice?(again, 'y', 'n')
  end
  again
end

def match_end(hsh, winner)
  five_wins = hsh.values.any? { |v| v == 2 }
  prompt "#{winner} is the first to 5 wins.  The match is over!" if five_wins
  five_wins
end

name = welcome.downcase
win_count = Hash.new(0)
loop do
  board = initialize_board
  game_flow(board, name)
  display_board(board)
  winner = game_end(board, win_count)
  break if !!match_end(win_count, winner)
  again = play_again
  break unless again == 'y'
end

prompt 'Thanks for playing TicTacToe.  Goodbye.'




##############################################################
# def row(dimension)
#   brd = (1..9).zip(['X'] * 9).to_h
#   cell = "        " + "|"
#   cell_with_value = "   #{brd[1]}    " + "|"
#   separator = "--------+"

#   puts cell * dimension
#   puts cell_with_value * dimension # each_with_index (use idx as key to brd hash)
#   puts cell * dimension
#   puts separator * dimension
# end

# row(3)
# row(3)
