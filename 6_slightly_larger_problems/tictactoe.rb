require 'pry'

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

def winning_lines_list(dimension)
  size = dimension**2
  rows = [*(1..size).each_slice(dimension)]
  cols = rows.transpose
  diagonals = [rows, rows.map(&:reverse)].map do |arr|
    arr.map.with_index { |arr, idx| arr[idx] }
  end
  [rows, cols, diagonals]
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  # Add message for player here
  puts ""
  puts "      |        |"
  puts "   #{brd[1]}  |    #{brd[2]}   |  #{brd[3]}"
  puts "      |        |"
  puts "------+--------+------"
  puts "      |        |"
  puts "   #{brd[4]}  |    #{brd[5]}   |  #{brd[6]}"
  puts "      |        |"
  puts "------+--------+------"
  puts "      |        |"
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
  if current_player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  current_player == 'player' ? 'computer' : 'player'
end

def valid_choice?(choice, *options)
  options.include?(choice)
end

def first_move_decision
  decider = ''
  loop do
    prompt 'Do you want to choose who moves first or would you like to let the computer decide? (player or computer)'
    decider = gets.chomp.strip
    break if valid_choice?(decider, 'player', 'computer')
    prompt 'That is not a valid answer'
  end
  decider
end

def first_move(decider)
  first_move = ''
  loop do
    if decider == 'player'
      puts 'Choose who makes the first moves.  (player or computer)'
      first_move = gets.chomp.strip
    else
      first_move = %w(player computer).sample
      if first_move == 'player'
        prompt 'Computer is giving you the first move!'
      else
        prompt 'Computer decided to move first!'
      end
    end
    break if valid_choice?(first_move, 'player', 'computer')
    prompt 'That is not a valid answer'
  end
  first_move
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

def game_flow(brd)
  decider = first_move_decision
  current_player = first_move(decider)
  sleep(2)
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

win_count = Hash.new(0)
loop do
  board = initialize_board
  game_flow(board)
  display_board(board)
  winner = game_end(board, win_count)
  break if !!match_end(win_count, winner)
  again = play_again
  break unless again == 'y'
end

prompt 'Thanks for playing TicTacToe.  Goodbye.'


