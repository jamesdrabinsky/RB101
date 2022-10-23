  # sum = cards.reduce(0) do |total, card|
  #   total += card_hash.fetch(card[1], 0)
  # end

  ##############################################################


  # def calculate_sum(cards, card_hash, target = 21)
  #   sum = cards.sum { |card| card_hash.fetch(card[1], 0) }
  #   cards.select { |card| card[1] == 'A' }.count.times do
  #     if sum < (target - 10)
  #        sum += 11
  #     else 
  #       sum += 1
  #     end
  #   end
  #   sum
  # end

  ##############################################################

  # def calculate_sum(cards, card_hash, target = 21)
  #   sum = cards.sum { |card| card_hash.fetch(card[1], 0) }
  #   cards.count { |card| card[1] == 'A' }.times do |(total, _), _|
  #     if total < (target - 10)
  #       total += 10
  #     else
  #       total += 1
  #     end
  #   end
  #   total
  # end

  ##############################################################

  # def display_hand(cards, turn = 'player', start = false)
  #   player = turn == 'player' ? 'Player' : 'Dealer'
  
  #   if start
  #     puts "Player's hand is:\n\t#{cards[0].join("\n\t")}\n\n"
  #     puts "Dealer's hand is:\n\t#{cards[1][0]}\n\t?\n\n"
  #   else
  #     puts "#{player}'s hand is:\n\t#{cards[0].join("\n\t")}\n\n"
  #   end
  # end

  ##############################################################

  # def hand_result(hand_total)
#   if bust?(hand_total)
#     -1
#   elsif hand_total == 21
#     1
#   end
# end

# def display_result(result, player_dealer, total = nil)
#   opp = player_dealer == 'Player' ? 'Dealer' : 'Player'
#   if result == -1
#     puts "\n#{player_dealer}'s card total exceeds 21!\n#{player_dealer} busted! #{opp} wins!"
#   elsif result == 1
#     puts "\n#{player_dealer}'s card total is 21.  #{player_dealer} wins!"
#   else
#     puts "\n#{player_dealer} chose to stay at #{total}."
#   end
# end

  ##############################################################

# def display_winner(player_score, dealer_score)
#   if player_score > dealer_score
#     'Player wins!'
#   elsif player_score < dealer_score
#     'Dealer wins!'
#   else
#     "It's a tie!"
#   end
# end

  ##############################################################


#   if player_total == 21
#     :player_21
#   elsif dealer_total == 21
#     :dealer_21
#   elsif player_total > 21
#     :player_busted
#   elsif dealer_total > 21
#     :dealer_busted
#   elsif dealer_total < player_total
#     :player
#   elsif dealer_total > player_total
#     :dealer
#   else
#     :tie
#   end
# end

  ##############################################################

#   case result
#   when :player_21
#     puts "You hit 21.  You win!\n"
#   when :dealer_21
#     puts "Dealer hit 21.  Dealer wins!\n"
#   when :player_busted
#     puts "You busted! Dealer wins!\n"
#   when :dealer_busted
#     puts "Dealer busted! You win!\n"
#   when :player
#     puts "You win!\n"
#   when :dealer
#     puts "Dealer wins!\n"
#   when :tie
#     puts "It's a tie!\n"
#   end
# end

  ##############################################################

# def take_turn(deck, player_hand, dealer_hand, player_total, dealer_total,
#               hsh, *results)
#   player_total = player_turn(player_hand, deck)
#   display_score(dealer_hand, player_hand, dealer_total, player_total)
#   result = detect_result(player_total, dealer_total)
#   end_game = results.include?(result)
#   if end_game
#     display_result(player_total, dealer_total)
#     record_result(result, hsh)
#     sleep(2)
#   end
#   end_game
# end

  ##############################################################

  # end_game = take_turn(deck, hands[0], hands[1], totals[0], totals[1],
  #                      game_tracker, :player_21, :player_busted)