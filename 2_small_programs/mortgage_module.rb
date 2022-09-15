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
  ((integer? number) || (float? number)) && (number.to_i >= 0) && !number.empty?
end

def monthly_interest_rate_conversion(apr)
  (apr.to_f / 100) / 12
end

def mortgage_formula(loan_amount, monthly_interest_rate, loan_duration)
  loan_amount * (
    monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration))
  )
end

def update_hash(hash, key, value)
  hash[key] = case key
              when 'monthly_interest_rate'
                monthly_interest_rate_conversion(value)
              when 'loan_duration'
                (12 * value[0].to_i) + value[1].to_i
              when 'monthly_payment'
                mortgage_formula(*hash.each_value)
              else
                value.to_f
              end
end

def format_number(number)
  # Source:
  # https://rick-moore.medium.com/formatting-number-strings-in-ruby-4da35d5282e3"
  whole, decimal = number.split('.')
  if whole.to_i < -999 || whole.to_i > 999
    whole.reverse!.gsub!(/(\d{3})(?=\d)/, '\\1,').reverse!
  end
  [whole, decimal].compact.join('.')
end

def validate_entry(error_msg, method = method(:number?))
  amount = ''
  loop do
    amount = gets.chomp
    if amount.split.size == 1
      break if method.call amount
    else
      amount = amount.split
      break if amount.all? { |x| method.call x } && amount.size == 2
    end
    prompt error_msg
  end
  amount
end

def confirm_entry(post_msg, amount)
  if amount.is_a? String
    prompt post_msg % { placeholder: format_number(amount) }
  else
    prompt post_msg % { placeholder: amount[0], placeholder2: amount[-1] }
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
    amount = validate_entry(error_msg, method = validate)
    confirmation = confirm_entry(post_msg, amount)
    if confirmation == '1'
      update_hash(hash, key, amount)
      break
    end
    prompt "OK, let's try again..."
  end
end

def summarize(hash)
  h2 = hash.clone
  h2['loan_amount'] = "$#{format_number('%0.2f' % hash['loan_amount'].to_s)}"
  h2['monthly_interest_rate'] = (
    "#{'%0.2f' % (100 * hash['monthly_interest_rate'])}%"
  )
  years, months = hash['loan_duration'].divmod(12)
  h2['loan_duration'] = "#{years} years and #{months} months"
  h2['monthly_payment'] = (
    "$#{format_number('%0.2f' % hash['monthly_payment'].to_s)}"
  )
  h2.each { |k, v| puts "\n#{k.ljust(25)}#{v}" }
end

# def program_loop(hash, *subprocs)
#   answer = ''
#   loop do
#     subprocs.each
#     # monthly_payment = mortgage_formula(*hash.each_value)
#     # update_hash(hash, 'monthly_payment', monthly_payment)
#     loop do
#       prompt MESSAGES['monthly_payment']['intro_msg']
#       # summarize(hash)
#       prompt MESSAGES['monthly_payment']['post_msg']
#       answer = gets.chomp
#       break if !answer.empty? && %w(1 2).include?(answer)
#       prompt 'Invalid entry. To confirm, please enter either 1 (yes) or 2 (no):'
#     end
#     hash.delete('monthly_payment')
#     break if answer == '2'
#   end
#   prompt MESSAGES['outro_msg']
# end
