# Ask the user for the loan amount
# Ask the user for the Annual Percentage Rate (APR)
# Ask the user for the loan duration
# Use the above information to calculate:
# the monthly interest rate
# the loan duration in months
# the monthly payment

require 'yaml'
MESSAGES = YAML.load_file('2_small_programs/mortgage_calculator.yml')
user_values = {}

def prompt(msg)
  puts "\n=> #{msg}"
end

def integer?(number)
  number.to_i.to_s == number
end

def float?(number)
  number.to_f.to_s == number
end

def number?(number)
  ((integer? number) || (float? number)) && (number.to_i >= 0)
end

def monthly_interest_rate_conversion(apr)
  (apr.to_f / 100) / 12
end

def update_hash(hash, key, value)
  hash[key] = case key
              when 'apr'
                monthly_interest_rate_conversion(value)
              when 'loan_duration'
                (12 * value[0].to_i) + value[1].to_i
              else
                value
              end
end

def validate_entry(error_msg, validate = method(:number?))
  amount = ''
  loop do
    amount = gets.chomp
    if amount.split.size == 1
      break if validate.call amount
    else
      amount = amount.split
      break if amount.all? { |x| validate.call x }
    end
    prompt error_msg
  end
  amount
end

def confirm_entry(post_msg, amount)
  if amount.is_a? String
    prompt post_msg % { placeholder: amount }
  else
    prompt post_msg % { placeholder: amount[0], placeholder2: amount[-1]}
  end
  answer = ''
  loop do
    answer = gets.chomp
    break if %w(1 2).include?(answer)
    prompt 'Invalid entry. To confirm, please enter either 1 (yes) or 2 (no):'
  end
  answer
end

def full_validation(
  intro_msg,
  error_msg,
  post_msg,
  hash,
  key,
  validate = method(:number?)
)
  loop do
    prompt intro_msg
    amount = validate_entry(error_msg, validate = validate)
    confirmation = confirm_entry(post_msg, amount)
    if confirmation == '1'
      update_hash(hash, key, amount)
      break
    end
    prompt "OK, let's try again..."
  end
end

def mortgage_formula(loan_amount, monthly_interest_rate, loan_duration)
  loan_amount * (
    monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration))
  )
end

prompt MESSAGES['intro_msg']

full_validation(
  MESSAGES['loan_amount']['intro_msg'],
  MESSAGES['loan_amount']['error_msg'],
  MESSAGES['loan_amount']['post_msg'],
  user_values,
  'loan_amount'
)

full_validation(
  MESSAGES['apr']['intro_msg'],
  MESSAGES['apr']['error_msg'],
  MESSAGES['apr']['post_msg'],
  user_values,
  'apr'
)

full_validation(
  MESSAGES['loan_duration']['intro_msg'],
  MESSAGES['loan_duration']['error_msg'],
  MESSAGES['loan_duration']['post_msg'],
  user_values,
  'loan_duration'
)

print user_values