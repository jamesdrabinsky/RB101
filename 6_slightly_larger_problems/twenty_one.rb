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
  [*deck.shift(4).each_slice(2)]
end

def full_suits_and_values(hand)
  hand.map do |suit, value|
    "#{FACES.fetch(value.to_sym, value)} of #{SUITS[suit.to_sym]}"
  end
end

# rubocop:disable Style/ConditionalAssignment
def calculate_sum(cards, target = 21)
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

def hand_result(hand_total)
  if bust?(hand_total)
    -1
  elsif hand_total == 21
    1
  end
end

def detect_result
  nil
end

def display_result(result, player_dealer, total = nil)
  opp = player_dealer == 'Player' ? 'Dealer' : 'Player'
  if result == -1
    puts "\n#{player_dealer}'s card total exceeds 21!\n#{player_dealer} busted! #{opp} wins!"
  elsif result == 1
    puts "\n#{player_dealer}'s card total is 21.  #{player_dealer} wins!"
  else
    puts "#{player_dealer} chose to stay at #{total}."
  end
end

def player_turn(hand, deck)
  sum = calculate_sum(hand)
  loop do
    puts "Hit or stay?"
    move = gets.chomp.strip
    break if move == 'stay'
    puts "\nPlayer hit."
    clear_screen(2)

    hit!(hand, deck)
    sum = calculate_sum(hand)
    display_hand(hand, 'player', sum)
    break if (bust?(sum)) || (sum == 21)
  end
  [sum, hand_result(sum)]
end

def dealer_turn(hand, deck)
  sum = calculate_sum(hand)
  loop do
    break if sum >= 17
    puts "Dealer hit."
    clear_screen(3)
    hit!(hand, deck)
    sum = calculate_sum(hand, 17)
    display_hand(hand, 'dealer', sum)
  end
  [sum, hand_result(sum)]
end

def winning_hand(player_score, dealer_score)
  if player_score > dealer_score
    'Player wins!'
  elsif player_score < dealer_score
    'Dealer wins!'
  else
    "It's a tie!"
  end
end

def play_again?
  puts ""
  puts "-------------"
  puts "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

loop do
  system 'clear'
  deck = initialize_deck
  player_hand, dealer_hand = deal_cards(deck)
  player_total = calculate_sum(player_hand)
  display_hand(dealer_hand, 'dealer', 0, true)
  display_hand(player_hand, 'player', player_total)

  # Player's turn
  player_total, player_res = player_turn(player_hand, deck)
  display_result(player_res, 'Player', player_total)
  sleep(2)
  if !!player_res
    play_again? ? next : break
  end

  # Dealer's turn
  puts "\nDealer's turn..."
  clear_screen(2)
  dealer_total, dealer_res = dealer_turn(dealer_hand, deck)
  display_result(dealer_res, 'Dealer', dealer_total)
  sleep(2)
  if !!dealer_res
    play_again? ? next : break
  end

  # Determine winner
  clear_screen(2)
  puts "=============="
  display_hand(dealer_hand, 'dealer', dealer_total)
  display_hand(player_hand, 'player', player_total)
  puts "==============\n\n"
  puts winning_hand(player_total, dealer_total)

  # Play again?
  break unless play_again?
end

puts "Thank you for playing Twenty-One! Good bye!"
