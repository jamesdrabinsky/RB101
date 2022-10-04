=begin
Write a method that takes a positive integer or zero, and converts it to a string representation.
=end

# DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do 
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

def integer_to_string(number)
  digits = []
  if number.zero?
    digits << 0
  else
    while number > 0
      number, rem = number.divmod(10)
      digits.unshift(rem)
    end
  end
  digits.join
end

def integer_to_string2(number)
  number.digits.reverse.join
end

p integer_to_string2(4321) == '4321'
p integer_to_string2(0) == '0'
p integer_to_string2(5000) == '5000'