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

def clear(time = 2)
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
  clear(0)
  prompt MESSAGES['intro_msg']
  name = ''
  loop do
    name = gets.chomp.strip
    clear(1)
    if valid_name?(name)
      puts format(MESSAGES['name']['post_msg'], { player: name })
      sleep(2)
      break
    end
    prompt MESSAGES['name']['error_msg']
  end
  name
end

def display_msg(name, current_player, move_count)
  clear(1)
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  if current_player == name_abbrev(name)
    puts format(MESSAGES['moves']['player_count'],
                { player: name, play_count: move_count })
  else
    puts format(MESSAGES['moves']['computer_count'], { play_count: move_count })
  end
end

# rubocop:disable Metrics/AbcSize
def display_board(brd, name, move_count, current_player, message = true)
  message ? display_msg(name, current_player, move_count) : (puts "Final Board")
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

def name_abbrev(name)
  name.downcase.start_with?('c') ? name[0..1].downcase : name[0].downcase
end

def first_move_decision(name)
  clear(1)
  decider = ''
  loop do
    prompt format(MESSAGES['first_move_decision']['intro_msg'],
                  { player_letter: name_abbrev(name), player_name: name })
    decider = gets.chomp.strip.downcase
    break if valid_choice?(decider, name_abbrev(name), 'c')
    puts MESSAGES['first_move_decision']['error_msg']
    clear
  end
  decider
end

def first_move(decider, name)
  clear(1)
  first_move = ''
  loop do
    if decider == name_abbrev(name)
      prompt format(MESSAGES['first_move']['intro_msg'],
                    { player_letter: name_abbrev(name), player_name: name })
      first_move = gets.chomp.strip.downcase
    else
      first_move = [name_abbrev(name), 'c'].sample
      computer_first_move_msg(first_move, name)
    end
    break if valid_choice?(first_move, name_abbrev(name), 'c')
    prompt MESSAGES['first_move']['error_msg']
    clear
  end
  first_move
end

def computer_first_move_msg(first_move, name)
  if first_move == name_abbrev(name)
    puts MESSAGES['first_move']['player']
  else
    puts MESSAGES['first_move']['computer']
  end
  sleep(2)
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt format(MESSAGES['moves']['player_options'],
                  { options: joinor(empty_squares(brd)) })
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    puts format(MESSAGES['moves']['error_msg'], { selection: square })
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

def place_piece!(brd, name, current_player)
  if current_player == name_abbrev(name)
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(name, current_player)
  current_player == name_abbrev(name) ? 'computer' : name_abbrev(name)
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd, name)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return name
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def someone_won?(brd, name)
  !!detect_winner(brd, name)
end

def add_win(winner, hsh)
  hsh[winner] += 1 if winner
  hsh[:total] += 1
end

def game_flow(brd, name)
  decider = first_move_decision(name)
  current_player = first_move(decider, name)
  play_count = 1
  move_count = 1
  loop do
    display_board(brd, name, move_count, current_player)
    place_piece!(brd, name, current_player)
    current_player = alternate_player(name, current_player)
    play_count += 1
    move_count += 1 if play_count.odd?
    break if someone_won?(brd, name) || board_full?(brd)
  end
  clear(1)
  display_board(brd, name, move_count, current_player, false)
end

def game_end(brd, name, hsh)
  winner = detect_winner(brd, name)
  if someone_won?(brd, name)
    puts format(MESSAGES['game_end']['winner'], { winner: winner })
  else
    puts MESSAGES['game_end']['tie']
  end
  add_win(winner, hsh)
  puts format(MESSAGES['game_end']['score'],
              { game_count: hsh[:total], player: name,
                player_wins: hsh[name], computer_wins: hsh['Computer'] })
  puts "\n\n"
  winner
end

def play_again
  again = ''
  loop do
    prompt MESSAGES['game_end']['post_msg']
    again = gets.chomp.strip
    break if valid_choice?(again, 'y', 'n')
    clear
    prompt MESSAGES['match_end']['error_msg']
  end
  again
end

def match_end(hsh, winner)
  five_wins = hsh.any? { |k, v| (v == 5) && k != :total }
  puts format(MESSAGES['match_end']['end'], { winner: winner }) if five_wins
  five_wins
end

name = welcome
win_count = Hash.new(0)
loop do
  board = initialize_board
  game_flow(board, name)
  clear
  winner = game_end(board, name, win_count)
  break if !!match_end(win_count, winner)

  again = play_again
  if again == 'n'
    clear
    puts MESSAGES['match_end']['early']
    break
  end
end

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

# def winning_lines_list(dimension)
#   size = dimension**2
#   rows = [*(1..size).each_slice(dimension)]
#   cols = rows.transpose
#   diagonals = [rows, rows.map(&:reverse)].map do |arr|
#     arr.map.with_index { |sub_arr, idx| sub_arr[idx] }
#   end
#   [rows, cols, diagonals]
# end


# https://www.youtube.com/watch?v=trKjYdBASyQ