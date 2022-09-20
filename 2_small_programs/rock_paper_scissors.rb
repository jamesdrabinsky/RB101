require 'yaml'
MESSAGES = YAML.load_file('./rock_paper_scissors.yml')

VALID_CHOICES = %w(r p sc sp l).freeze

RPSSL = {
  rock: { abbrev: 'r', beats: ['scissors', 'lizard'] },
  paper: { abbrev: 'p', beats: ['rock', 'spock'] },
  scissors: { abbrev: 'sc', beats: ['paper', 'lizard'] },
  spock: { abbrev: 'sp', beats: ['scissors', 'rock'] },
  lizard: { abbrev: 'l', beats: ['spock', 'paper'] }
}

def prompt(message)
  sleep(1.5)
  puts "\n=> #{message}"
end

def name?(name)
  name.strip!
  (!name.empty?) && (name.match?(/^[[:alpha:][:blank:]]+$/))
end

def valid_choice?(choice)
  VALID_CHOICES.include? choice
end

def convert_to_full(abbrev)
  RPSSL.find { |_, v| v[:abbrev] == abbrev }.first
end

def get_full_names(first, second)
  [first, second].map { |abbrev| convert_to_full(abbrev) }
end

def wins?(first, second)
  RPSSL[first][:beats].include? second.to_s
end

def add_win(hash, winner)
  hash[winner] += 1
end

def get_scenario(player, computer)
  if wins?(player, computer)
    'player'
  elsif wins?(computer, player)
    'computer'
  else 'tie'
  end
end

def display_result(player, computer)
  prompt format(MESSAGES['choice']['post_msg'],
                { first: player, second: computer })
  result = get_scenario(player, computer)
  prompt format(MESSAGES['result'][result]['update'],
                { player: player,
                  computer: computer })
end

def update_hash(player, computer, hash)
  result = get_scenario(player, computer).to_sym
  add_win(hash, result) if hash.include? result
end

def three_wins?(hash)
  hash.each_value.any? { |v| v == 3 }
end

def hash_winner(hash)
  (hash.find { |_, v| v == 3 }.first).to_s
end

def display_score(hash, player_name)
  prompt format(MESSAGES['result']['updated_score_msg'],
                { player: player_name,
                  player_score: hash[:player],
                  computer_score: hash[:computer] })
end

def display_final_score(hash, winner, player_name)
  prompt format(MESSAGES['result'][winner]['final'],
                { player_name: player_name })
  prompt format(MESSAGES['final_score_msg'],
                { player: player_name,
                  player_score: hash[:player],
                  computer_score: hash[:computer] })
end

##############################################################

prompt MESSAGES['intro_msg']

name = ''
loop do
  name = gets.chomp
  break if name?(name)
  prompt MESSAGES['name']['error_msg']
end
prompt format(MESSAGES['name']['post_msg'], { placeholder: name })

play_again = ''
winner = ''
loop do
  win_tracker = { player: 0, computer: 0 }
  choice = ''
  loop do
    loop do
      prompt MESSAGES['choice']['intro_msg']
      choice = gets.chomp.downcase
      break if valid_choice? choice
      prompt format(MESSAGES['choice']['error_msg'], { placeholder: choice })
    end
    computer_choice = VALID_CHOICES.sample
    player, computer = get_full_names(choice, computer_choice)
    display_result(player, computer)
    update_hash(player, computer, win_tracker)
    if three_wins? win_tracker
      winner = hash_winner win_tracker
      break
    end
    display_score(win_tracker, name)
    sleep(2)
    system('clear')
  end
  display_final_score(win_tracker, winner, name)
  loop do
    prompt format(MESSAGES['play_again'][winner], { player_name: name })
    play_again = gets.chomp
    break if %w(1 2).include? play_again
    prompt format(MESSAGES['play_again']['error_msg'],
                  { placeholder: play_again })
  end
  break if play_again == '2'
  system('clear')
end

prompt format(MESSAGES['outro_msg'], { player_name: name })
