# Ask the user for the loan amount
# Ask the user for the Annual Percentage Rate (APR)
# Ask the user for the loan duration
# Use the above information to calculate:
# the monthly interest rate
# the loan duration in months
# the monthly payment

require 'yaml'
require './mortgage_module.rb'
MESSAGES = YAML.load_file('./mortgage_calculator.yml')

prompt MESSAGES['intro_msg']

answer = ''
loop do 
  user_values = {}

  full_validation(
    MESSAGES['loan_amount']['intro_msg'],
    MESSAGES['loan_amount']['error_msg'],
    MESSAGES['loan_amount']['post_msg'],
    user_values,
    'loan_amount'
  )
  full_validation(
    MESSAGES['monthly_interest_rate']['intro_msg'],
    MESSAGES['monthly_interest_rate']['error_msg'],
    MESSAGES['monthly_interest_rate']['post_msg'],
    user_values,
    'monthly_interest_rate'
  )
  full_validation(
    MESSAGES['loan_duration']['intro_msg'],
    MESSAGES['loan_duration']['error_msg'],
    MESSAGES['loan_duration']['post_msg'],
    user_values,
    'loan_duration'
  )

  monthly_payment = mortgage_formula(*user_values.each_value)
  update_hash(user_values, 'monthly_payment', monthly_payment)
  print user_values

  loop do
    prompt MESSAGES['monthly_payment']['intro_msg']
    summarize(user_values)
    prompt MESSAGES['monthly_payment']['post_msg']
    answer = gets.chomp
    break if !answer.empty? && %w(1 2).include?(answer)
    prompt 'Invalid entry. To confirm, please enter either 1 (yes) or 2 (no):'
  end
  break if answer == '2'
end

prompt MESSAGES['outro_msg']