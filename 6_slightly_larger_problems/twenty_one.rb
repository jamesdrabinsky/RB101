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
  results.find(-> { [:tie, _] }) { |_, v| v }[0]
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

def game_tracker

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

def play_again?
  puts ""
  puts "-------------"
  puts "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

win_tracker = {}
loop do
  system 'clear'
  deck = initialize_deck
  player_hand, dealer_hand = deal_cards(deck)
  player_total, dealer_total = [player_hand, dealer_hand].map do |hand|
    total(hand)
  end
  display_hand(dealer_hand, 'dealer', 0, true)
  display_hand(player_hand, 'player', player_total)

  player_total = player_turn(player_hand, deck)
  display_score(dealer_hand, player_hand, dealer_total, player_total)
  if [:player_21, :player_busted].include?(
    detect_result(player_total, dealer_total)
  )
    display_result(player_total, dealer_total)
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
  if [:dealer_21, :dealer_busted].include?(
    detect_result(player_total, dealer_total)
  )
    display_result(player_total, dealer_total)
    sleep(2)
    play_again? ? next : break
  else
    puts "Dealer chose to stay at #{dealer_total}"
    sleep(2)
  end

  display_score(dealer_hand, player_hand, dealer_total, player_total, true)
  break unless play_again?
end

puts "Thank you for playing Twenty-One! Good bye!"
