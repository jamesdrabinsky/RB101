# Ask the user for the loan amount, APR and loan duration
# Calculate:the monthly interest rate, loan duration and monthly payment

require 'yaml'
require './mortgage_module.rb'
MESSAGES = YAML.load_file('./mortgage_calculator.yml')

name = ''
loop do
  prompt MESSAGES['intro_msg']
  name = gets.chomp
  break if name? name
  prompt MESSAGES['name']['error_msg']
end
prompt MESSAGES['name']['post_msg'] % { placeholder: name }

answer = ''
loop do
  user_values = {}

  two_step_validation(
    MESSAGES['loan_amount']['intro_msg'],
    MESSAGES['loan_amount']['error_msg'],
    MESSAGES['loan_amount']['post_msg'],
    user_values,
    'loan_amount'
  )
  two_step_validation(
    MESSAGES['monthly_interest_rate']['intro_msg'],
    MESSAGES['monthly_interest_rate']['error_msg'],
    MESSAGES['monthly_interest_rate']['post_msg'],
    user_values,
    'monthly_interest_rate'
  )
  two_step_validation(
    MESSAGES['loan_duration']['intro_msg'],
    MESSAGES['loan_duration']['error_msg'],
    MESSAGES['loan_duration']['post_msg'],
    user_values,
    'loan_duration',
    method(:month_year?)
  )

  final_hash_update user_values
  prompt MESSAGES['monthly_payment']['intro_msg']
  display_summary user_values
  prompt MESSAGES['monthly_payment']['post_msg']
  answer = confirm_entry
  break if answer == '2'
end

prompt MESSAGES['outro_msg'] % { placeholder: name }
