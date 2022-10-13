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
  ((integer? number) || (float? number)) \
  && (number.to_i >= 0) && (!number.empty?)
end

def month_year?(numbers)
  month_year = numbers.split
  (month_year.all? { |x| number? x }) && (month_year.size == 2)
end

def name?(name)
  (!name.empty?) && (name.match?(/^[[:alpha:][:blank:]]+$/))
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
  # Source: https://rick-moore.medium.com/formatting-number-strings-in-ruby"
  whole, decimal = number.split('.')
  if whole.to_i < -999 || whole.to_i > 999
    whole.reverse!.gsub!(/(\d{3})(?=\d)/, '\\1,').reverse!
  end
  [whole, decimal].compact.join('.')
end

def split_string?(string)
  string.split.size > 1
end

def validate_entry(error_msg, method = method(:number?))
  amount = ''
  loop do
    amount = gets.chomp
    break if method.call amount
    prompt error_msg
  end
  amount
end

def display_entry(post_msg, amount)
  if amount.is_a? String
    prompt post_msg % { placeholder: format_number(amount) }
  else
    prompt post_msg % { placeholder: amount[0], placeholder2: amount[-1] }
  end
end

def confirm_entry
  answer = ''
  loop do
    answer = gets.chomp
    break if !answer.empty? && %w(1 2).include?(answer)
    prompt 'Invalid entry. To confirm, please enter either 1 (Yes) or 2 (No):'
  end
  answer
end

def one_step_validation
  "For name and outro"
end

def two_step_validation(
  intro_msg,
  error_msg,
  post_msg,
  hash,
  key,
  validate = method(:number?)
)
  loop do
    prompt intro_msg
    amount = validate_entry(error_msg, validate)
    processed_amount = split_string?(amount) ? amount.split : amount
    display_entry(post_msg, processed_amount)
    confirmation = confirm_entry
    if confirmation == '1'
      update_hash(hash, key, processed_amount)
      break
    end
    prompt "OK, let's try again..."
  end
end

def format_hash_values(hash)
  hash['loan_amount'] = "$#{format_number('%0.2f' % hash['loan_amount'].to_s)}"
  hash['monthly_interest_rate'] = (
    "#{'%0.2f' % (100 * hash['monthly_interest_rate'])}%"
  )
  years, months = hash['loan_duration'].divmod(12)
  hash['loan_duration'] = "#{years} years and #{months} months"
  hash['monthly_payment'] = (
    "$#{format_number('%0.2f' % hash['monthly_payment'].to_s)}"
  )
end

def final_hash_update(hash)
  monthly_payment = mortgage_formula(*hash.each_value)
  update_hash(hash, 'monthly_payment', monthly_payment)
  format_hash_values(hash)
end

def display_summary(hash)
  hash.each { |k, v| puts "\n#{k.ljust(25)}#{v}" }
end
