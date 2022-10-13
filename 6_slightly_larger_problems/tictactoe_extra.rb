# if brd[line[0]] == PLAYER_MARKER &&
#    brd[line[1]] == PLAYER_MARKER &&
#    brd[line[2]] == PLAYER_MARKER
#   return 'Player'
# elsif brd[line[0]] == COMPUTER_MARKER &&
#       brd[line[1]] == COMPUTER_MARKER &&
#       brd[line[2]] == COMPUTER_MARKER
#   return 'Computer'
# end
# if brd.values_at(line[0], line[1], line[2]).all? { |v| v == PLAYER_MARKER }
# if brd.values_at(*line).all? { |v| v == PLAYER_MARKER }

# elsif brd.values_at(line[0], line[1], line[2]).all? { |v| v == COMPUTER_MARKER }
# elsif brd.values_at(*line).all? { |v| v == COMPUTER_MARKER }

############################################################################

# def joinor(arr, sep1 = ', ', sep2 = 'or')
#   "#{arr[..-2].join(sep1)} #{sep2} #{arr[-1]}" 
# end

# def joinor2(arr, sep1 = ', ', sep2 = 'or')
#   last, first = arr.partition { |x| arr.index(x) == arr.size - 1 }
#   "#{first.join(sep1)} #{sep2} #{last[0].to_s}"
# end

# def joinor(arr, delimiter=', ', word='or')
#   case arr.size
#   when 0 then ''
#   when 1 then arr.first
#   when 2 then arr.join(" #{word} ")
#   else
#     arr[-1] = "#{word} #{arr.last}"
#     arr.join(delimiter)
#   end
# end

############################################################################

# def computer_places_piece!(brd)
#   square = empty_squares(brd).sample
#   brd[square] = COMPUTER_MARKER
# end

############################################################################

# def find_computer_strategy(brd)
#   attack_square = find_computer_square(brd)
#   defend_square = find_computer_square(brd, false)
  
#   if attack_square
#     puts "Filling in square square #{attack_square}!"
#     return attack_square
#   elsif defend_square
#     puts "Blocking the threat at square #{defend_square}!"
#     return defend_square
#   end
#   empty_squares(brd).sample
# end

############################################################################

  # if someone_won?(board)
  #   winner = detect_winner(board)
  #   prompt "#{winner} won!"
  #   add_win(winner, win_count)
  #   puts win_count.inspect
  # else
  #   prompt "It's a tie!"
  # end

  ############################################################################


# if win_count.values.any? { |v| v == 5 }
  #   prompt "#{winner} is the first to 5 wins!"
  #   break
  # end

  ############################################################################

# brd.keys.select { |k| brd[k] == INITIAL_MARKER }
