require 'yaml'
MESSAGES = YAML.load_file('./rock_paper_scissors.yml')

VALID_CHOICES = %w(r p sc sp l).freeze

RPSLS = {
  rock: { abbrev: 'r', beats: ['scissors', 'lizard'] },
  paper: { abbrev: 'p', beats: ['rock', 'spock'] },
  scissors: { abbrev: 'sc', beats: ['paper', 'lizard'] },
  spock: { abbrev: 'sp', beats: ['scissors', 'rock'] },
  lizard: { abbrev: 'l', beats: ['spock', 'paper'] }
}

WIN_TRACKER = { player: 0, computer: 0 }

def prompt(message)
  puts "\n=> #{message}"
end

def get_full_name(abbrev)
  RPSLS.find { |_, v| v[:abbrev] == abbrev }.first
end

def wins?(choice1, choice2)
  RPSLS[choice1][:beats].include?(choice2.to_s)
end

def add_win(winner)
  WIN_TRACKER[winner] += 1
end

def display_results(player, computer)
  player_full, computer_full = [player, computer].each do |abbrev|
    get_full_name(abbrev)
  end

  if wins?(player_full, computer_full)
    add_win(:player)
    puts "You won!"
  elsif wins?(computer_full, player_full)
    add_win(:computer)
    puts "Computer won!"
  else
    puts "It's a tie!"
  end
end
 
prompt MESSAGES['intro_msg']

name = ''
loop do
  name = gets.chomp
  break unless name?(name)
  MESSAGES['name']['error_msg']
end
MESSAGES['name']['post_msg']

loop do

end


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
