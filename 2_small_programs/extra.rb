####mortgage calculator####

# if amount.split.size == 1
#   break if method.call amount
# else
#   amount = amount.split
#   break if (amount.all? { |x| method.call x }) && (amount.size == 2)
# end

# loop do
# prompt MESSAGES['monthly_payment']['intro_msg']
# display_summary(user_values)
# prompt MESSAGES['monthly_payment']['post_msg']
# answer = confirm_entry
# answer = gets.chomp
# break if !answer.empty? && %w(1 2).include?(answer)
# prompt 'Invalid entry. To confirm, please enter either 1 (yes) or 2 (no):'
# end

# def program_loop(*subprocs)
#   prompt MESSAGES['intro_msg']
#   answer = ''
#   loop do
#     hash = {}
#     subprocs.each
#     monthly_payment = mortgage_formula(*hash.each_value)
#     update_hash(hash, 'monthly_payment', monthly_payment)
#     loop do
#       prompt MESSAGES['monthly_payment']['intro_msg']
#       summarize(hash)
#       prompt MESSAGES['monthly_payment']['post_msg']
#       answer = gets.chomp
#       break if !answer.empty? && %w(1 2).include?(answer)
#       prompt 'Invalid entry. To confirm, please enter either 1 (yes) or 2 (no):'
#     end
#     break if answer == '2'
#   end
#   prompt MESSAGES['outro_msg']
# end

####rock_paper_scissors####

# possible_choices = {
#   'You won!': [%w[rock scissors], %w[paper rock], %w[scissors paper]],
#   'Computer won!': [%w[rock paper], %w[paper scissors], %w[scissors rock]]
# }

# def display_results2(hash, player, computer)
#   result = hash.find { |_, v| v.include? [player, computer] }
#   puts result ? result.first : "It's a tie!"
# end

# def win?(first, second)
#   (first == 'rock' && second == 'scissors') ||
#     (first == 'paper' && second == 'rock') ||
#     (first == 'scissors' && second == 'paper')
# end

# def display_results(player, computer)
#   if win?(player, computer)
#     prompt 'You won!'
#   elsif win?(computer, player)
#     prompt 'Computer won!'
#   else
#     prompt "It's a tie!"
#   end
# end
