require 'io/console'
require 'yaml'
MESSAGES = YAML.load_file('./twenty_one_messages.yml')

SUITS = { H: 'Hearts', D: 'Diamonds', C: 'Clubs', S: 'Spades' }
FACES = { J: 'Jack', Q: 'Queen', K: 'King', A: 'Ace' }
number_cards = (1..10).map { |num| [num.to_s, num] }
face_cards = ['J', 'Q', 'K'].map { |face| [face, 10] }
CARD_HASH = (number_cards + face_cards).to_h

def prompt(msg)
  puts "=> #{msg}"
end 

def clear_screen(time)
  sleep(time)
  system 'clear'
end

def continue
  puts
  prompt "Press any key to continue:"
  STDIN.getch
end

def valid_name?(name)
  name.match?(/^[A-Za-z]/)
end

def welcome
  clear_screen(0)
  prompt MESSAGES['intro_msg']
  name = ''
  loop do
    name = gets.chomp.strip
    clear_screen(1)
    if valid_name?(name)
      puts format(MESSAGES['name']['post_msg'], { player: name })
      continue
      break
    end
    prompt MESSAGES['name']['error_msg']
  end
  name
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
    puts format(MESSAGES['display_hand']['start'],
                { player: player, cards: full_names[0] })
  else
    puts format(MESSAGES['display_hand']['next'],
                { player: player, cards: full_names.join("\n  "),
                  total: total })
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
    dealer: dealer_total > player_total,
    tie: dealer_total == player_total
  }
  results.find { |_, v| v }[0]
end

def display_result(player_total, dealer_total)
  result = detect_result(player_total, dealer_total)
  results = {
    "You hit 21.  You win!" => :player_21,
    "Dealer hit 21.  Dealer wins!" => :dealer_21,
    "You busted! Dealer wins!" => :player_busted,
    "Dealer busted! You win!" => :dealer_busted,
    "You win!" => :player,
    "Dealer wins!" => :dealer,
    "It's a push!" => :tie
  }
  puts results.find { |_, v| result == v }[0]
end

def record_result(result, hsh, name)
  if %i(player_21 dealer_busted player).include?(result)
    hsh[name.to_sym] += 1
  elsif %i(dealer_21 player_busted dealer).include?(result)
    hsh[:dealer] += 1
  else
    hsh[:tie] += 1
  end
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def player_turn(hand, deck)
  sum = total(hand)
  loop do
    move = ''
    loop do
      prompt MESSAGES['game']['action']
      move = gets.chomp.strip
      break if %w(s h).include?(move)
      prompt MESSAGES['game']['error_msg']
      clear_screen(1)
    end
    break if move == 's'
    puts MESSAGES['game']['player_hit']
    clear_screen(1)

    hit!(hand, deck)
    last_card = hand[-1]
    sum = add_to_total(last_card, sum)
    display_hand(hand, 'player', sum)
    break if (bust?(sum)) || (sum == 21)
  end
  sum
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def dealer_turn(hand, deck)
  sum = total(hand)
  loop do
    break if sum >= 17
    puts MESSAGES['game']['dealer_hit']
    clear_screen(2)

    hit!(hand, deck)
    last_card = hand[-1]
    sum = add_to_total(last_card, sum, 17)
    display_hand(hand, 'dealer', sum)
    continue
  end
  sum
end

def display_score(dealer_hand, player_hand, dealer_total, player_total,
                  final = false)
  clear_screen(1)
  puts "============================"
  puts ""
  display_hand(dealer_hand, 'dealer', dealer_total)
  display_hand(player_hand, 'player', player_total)
  puts "============================\n\n"
  puts display_result(player_total, dealer_total) if final
end

def game_end_msg(hsh, name)
  clear_screen(0)
  total = hsh.values.sum
  games = total == 1 ? 'game' : 'games'
  puts format(MESSAGES['game']['end'],
              { total: total, games: games, name: name,
                player_wins: hsh.fetch(name.to_sym, 0),
                dealer_wins: hsh.fetch(:dealer, 0) })
end

def five_wins?(hsh)
  hsh.reject { |k, _| k == :tie }.values.any? { |v| v == 5 }
end

def match_winner(hsh)
  winner = hsh.reject { |k, _| k == :tie }.find { |_, v| v == 5 }[0]
  winner == :player ? 'You are' : 'Dealer is'
end

def play_again?
  answer = ''
  loop do
    prompt MESSAGES['game']['play_again']
    answer = gets.chomp
    break if %w(y n).include?(answer)
    prompt MESSAGES['game']['error_msg']
    clear_screen(1)
  end
  answer.downcase == 'y'
end

def start_game
  clear_screen(0)
  deck = initialize_deck
  player_hand, dealer_hand = deal_cards(deck)
  player_total, dealer_total = [player_hand, dealer_hand].map do |hand|
    total(hand)
  end
  display_hand(dealer_hand, 'dealer', 0, true)
  display_hand(player_hand, 'player', player_total)
  [deck, [player_hand, dealer_hand], [player_total, dealer_total]]
end

##########################################################################

game_tracker = Hash.new(0)
name = welcome
loop do
  game_info = start_game
  deck = game_info[0]
  player_hand, dealer_hand = game_info[1]
  _, dealer_total = game_info[2]

  player_total = player_turn(player_hand, deck)
  display_score(dealer_hand, player_hand, dealer_total, player_total)
  result = detect_result(player_total, dealer_total)
  if [:player_21, :player_busted].include?(result)
    display_result(player_total, dealer_total)
    record_result(result, game_tracker, name)
    if five_wins?(game_tracker)
      continue
      clear_screen(0)
      puts format(MESSAGES['match']['end'],
                  { winner: match_winner(game_tracker).capitalize })
      break
    end
    continue
    game_end_msg(game_tracker, name)
    play_again? ? next : break
  else
    puts "You chose to stay at #{player_total}"
    continue
  end

  clear_screen(1)
  puts "Dealer's turn...\n"
  sleep(1)
  dealer_total = dealer_turn(dealer_hand, deck)
  display_score(dealer_hand, player_hand, dealer_total, player_total)
  result = detect_result(player_total, dealer_total)
  if [:dealer_21, :dealer_busted].include?(result)
    display_result(player_total, dealer_total)
    record_result(result, game_tracker, name)
    if five_wins?(game_tracker)
      continue
      clear_screen(0)
      puts format(MESSAGES['match']['end'],
                  { winner: match_winner(game_tracker).capitalize })
      break
    end
    continue
    game_end_msg(game_tracker, name)
    play_again? ? next : break
  else
    puts "Dealer chose to stay at #{dealer_total}"
    continue
  end

  record_result(result, game_tracker, name)
  display_score(dealer_hand, player_hand, dealer_total, player_total, true)
  if five_wins?(game_tracker)
    continue
    clear_screen(0)
    puts format(MESSAGES['match']['end'],
                { winner: match_winner(game_tracker).capitalize })
    break
  end
  continue
  game_end_msg(game_tracker, name)
  sleep(2)

  break unless play_again?
end

clear_screen(0)
puts MESSAGES['outro_msg']
