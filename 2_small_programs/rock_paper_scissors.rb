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

win_tracker = { player: 0, computer: 0 }

def prompt(message)
  puts "\n=> #{message}"
end

def name?(name)
  (!name.empty?) && (name.match?(/^[[:alpha:][:blank:]]+$/))
end

def valid_choice?(choice)
  VALID_CHOICES.include?(choice)
end

def get_full_name(abbrev)
  RPSSL.find { |_, v| v[:abbrev] == abbrev }.first
end

def wins?(choice1, choice2)
  RPSSL[choice1][:beats].include?(choice2.to_s)
end

def add_win(hash, winner)
  hash[winner] += 1
end

def display_results(player, computer, hash)
  player_full, computer_full = [player, computer].map do |abbrev|
    get_full_name(abbrev)
  end

  if wins?(player_full, computer_full)
    add_win(hash, :player)
    prompt "Nice, you won!"
  elsif wins?(computer_full, player_full)
    add_win(hash, :computer)
    prompt "Shucks, the computer won!"
  else
    prompt "It's a tie!"
  end
end

def three_wins?(hash)
  !hash.select { |_, v| v == 3 }.empty?
end

def display_score(hash, player_name)
  prompt MESSAGES['choice']['score_msg'] % {
    player: player_name,
    player_score: hash[:player],
    computer_score: hash[:computer],
  }
end

prompt MESSAGES['intro_msg']

name = ''
loop do
  name = gets.chomp
  break if name?(name)
  prompt MESSAGES['name']['error_msg']
end
prompt MESSAGES['name']['post_msg'] % { placeholder: name }

choice = ''
loop do
  loop do
    prompt MESSAGES['choice']['intro_msg']
    choice = gets.chomp.downcase
    break if valid_choice? choice
    prompt MESSAGES['choice']['error_msg'] % { placeholder: choice }
  end
  computer_choice = VALID_CHOICES.sample
  display_results(choice, computer_choice, win_tracker)
  break if three_wins? win_tracker
  display_score(win_tracker, name)
end

MESSAGE['final_score']


# loop do
#   choice = ''
#   loop do
#     prompt "Choose one: #{VALID_CHOICES.join(', ')}"  
#     choice = gets.chomp
#     break if VALID_CHOICES.include?(choice)

#     prompt "That's not a valid choice."
#   end

#   computer_choice = VALID_CHOICES.sample

#   puts "You chose #{choice}; Computer chose #{computer_choice}"

#   display_results(choice, computer_choice)
#   prompt 'Do you want to play again?'
#   answer = gets.chomp
#   break unless answer.downcase.start_with?('y')
# end

# prompt 'Thank you for playing.  Good Bye!'