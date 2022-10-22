SUITS = { H: 'Hearts', D: 'Diamonds', C: 'Clubs', S: 'Spades' }
FACES = { J: 'Jack', Q: 'Queen', K: 'King', A: 'Ace' }
number_cards = (1..10).map { |num| [num.to_s, num] }
face_cards = ['J', 'Q', 'K'].map { |face| [face, 10] }
CARD_HASH = (number_cards + face_cards).to_h

def clear_screen(time)
  sleep(time)
  system 'clear'
end

def card_deck
  suits = ['H', 'D', 'C', 'S']
  values = (2..10).map(&:to_s) + ['J', 'Q', 'K', 'A']
  suits.each_with_object([]) do |s, arr|
    values.map { |v| arr.append([s, v]) }
  end
end

def initialize_deck
  card_deck.shuffle
end

def deal_cards(deck)
  [*deck.pop(4).each_slice(2)]
end

def full_suits_and_values(hand)
  hand.map do |suit, value|
    "#{FACES.fetch(value.to_sym, value)} of #{SUITS[suit.to_sym]}"
  end
end

# rubocop:disable Style/ConditionalAssignment
def total(cards, target = 21)
  sum = cards.sum { |card| CARD_HASH.fetch(card[1], 0) }
  cards.count { |card| card[1] == 'A' }.times do
    if sum < (target - 10)
      sum += 10
    else
      sum += 1
    end
  end
  sum
end

def add_to_total(card, total, target = 21)
  if card[1] == 'A'
    if total < (target - 10)
      total += 10
    else
      total += 1
    end
  else
    total += CARD_HASH[card[1]]
  end
  total
end
# rubocop:enable Style/ConditionalAssignment

def display_hand(hand, turn, total, start = false)
  player = turn == 'player' ? 'Player' : 'Dealer'
  full_names = full_suits_and_values(hand)
  if start
    puts "#{player}'s hand is:\n\t#{full_names[0]}\n\t?\n\n"
  else
    puts "#{player}'s hand is:\n\t#{full_names.join("\n\t")}\n\n"
    puts "For a total of: #{total}\n\n"
  end
end

def hit!(hand, deck)
  hand << deck.pop
end

def bust?(hand_total)
  hand_total > 21
end

def detect_result(player_total, dealer_total)
  results = {
    player_21: player_total == 21,
    dealer_21: dealer_total == 21,
    player_busted: player_total > 21,
    dealer_busted: dealer_total > 21,
    player: dealer_total < player_total,
    dealer: dealer_total > player_total
  }
  results.find(-> { [:tie, ""] }) { |_, v| v }[0]
end

def display_result(player_total, dealer_total)
  result = detect_result(player_total, dealer_total)
  results = {
    "You hit 21.  You win!\n" => :player_21,
    "Dealer hit 21.  Dealer wins!\n" => :dealer_21,
    "You busted! Dealer wins!\n" => :player_busted,
    "Dealer busted! You win!\n" => :dealer_busted,
    "You win!\n" => :player,
    "Dealer wins!\n" => :dealer
  }
  puts results.find(-> { ["It's a tie\n", :tie] }) { |_, v| result == v }[0]
end

def record_result(result, hsh)
  if %i(player_21 dealer_busted player).include?(result)
    hsh[:player] += 1
  elsif %i(dealer_21 player_busted dealer).include?(result)
    hsh[:dealer] += 1
  else
    hsh[:tie] += 1
  end
end

def player_turn(hand, deck)
  sum = total(hand)
  loop do
    puts "Hit or stay?"
    move = gets.chomp.strip
    break if move == 'stay'
    puts "\nPlayer hit."
    clear_screen(2)

    hit!(hand, deck)
    last_card = hand[-1]
    sum = add_to_total(last_card, sum)
    display_hand(hand, 'player', sum)
    break if (bust?(sum)) || (sum == 21)
  end
  sum
end

def dealer_turn(hand, deck)
  sum = total(hand)
  loop do
    break if sum >= 17
    puts "\nDealer hit."
    clear_screen(2)

    hit!(hand, deck)
    last_card = hand[-1]
    sum = add_to_total(last_card, sum, 17)
    display_hand(hand, 'dealer', sum)
  end
  sum
end

def display_score(dealer_hand, player_hand, dealer_total, player_total,
                  final = false)
  clear_screen(2)
  puts "============================"
  puts ""
  display_hand(dealer_hand, 'dealer', dealer_total)
  display_hand(player_hand, 'player', player_total)
  puts "============================\n\n"
  puts display_result(player_total, dealer_total) if final
end

def five_wins?(hsh)
  hsh.reject { |k, _| k == :tie }.values.any? { |v| v == 5 }
end

def match_winner(hsh)
  winner = hsh.reject { |k, _| k == :tie }.find { |_, v| v == 5 }[0]
  winner == :player ? 'You are' : 'Dealer is'
end

def game_end_msg(hsh)
  total = hsh.values.sum
  games = total == 1 ? 'game' : 'games'
  puts "After #{total} #{games} the score is:"
  puts "Player: #{hsh.fetch(:player, 0)}"
  puts "Dealer: #{hsh.fetch(:dealer, 0)}"
end

def play_again?
  puts ""
  puts "-------------"
  puts "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def start_game
  system 'clear'
  deck = initialize_deck
  player_hand, dealer_hand = deal_cards(deck)
  player_total, dealer_total = [player_hand, dealer_hand].map do |hand|
    total(hand)
  end
  display_hand(dealer_hand, 'dealer', 0, true)
  display_hand(player_hand, 'player', player_total)
  [deck, [player_hand, dealer_hand], [player_total, dealer_total]]
end

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

game_tracker = Hash.new(0)
loop do
  game_info = start_game
  deck = game_info[0]
  player_hand, dealer_hand = game_info[1]
  player_total, dealer_total = game_info[2]

  # end_game = take_turn(deck, hands[0], hands[1], totals[0], totals[1],
  #                      game_tracker, :player_21, :player_busted)

  player_total = player_turn(player_total, deck)
  display_score(dealer_hand, player_hand, dealer_total, player_total)
  result = detect_result(player_total, dealer_total)
  if [:player_21, :player_busted].include?(result)
    display_result(player_total, dealer_total)
    record_result(result, game_tracker)
    sleep(2)
    if five_wins?(game_tracker)
      puts "#{match_winner(game_tracker).capitalize} the first to five wins!"
      break
    end
    game_end_msg(game_tracker)
    sleep(2)
    play_again? ? next : break
  else
    puts "You chose to stay at #{player_total}"
    sleep(2)
  end

  clear_screen(1)
  puts "Dealer's turn...\n"
  dealer_total = dealer_turn(dealer_hand, deck)
  sleep(2)
  display_score(dealer_hand, player_hand, dealer_total, player_total)
  result = detect_result(player_total, dealer_total)
  if [:dealer_21, :dealer_busted].include?(result)
    display_result(player_total, dealer_total)
    record_result(result, game_tracker)
    sleep(2)
    if five_wins?(game_tracker)
      puts "#{match_winner(game_tracker).capitalize} is the first to five wins!"
      break
    end
    game_end_msg(game_tracker)
    sleep(2)
    play_again? ? next : break
  else
    puts "Dealer chose to stay at #{dealer_total}"
    sleep(2)
  end

  result = detect_result(player_total, dealer_total)
  record_result(result, game_tracker)
  display_score(dealer_hand, player_hand, dealer_total, player_total, true)
  if five_wins?(game_tracker)
    puts "#{match_winner(game_tracker).capitalize} is the first to five wins!"
    break
  end
  game_end_msg(game_tracker)
  sleep(2)

  break unless play_again?
end

puts "Thank you for playing Twenty-One! Good bye!"
