=begin
Write a method that takes a String of digits, and returns the appropriate number as an integer. 
The String may have a leading + or - sign; if the first character is a +, your method should return 
a positive number; if it is a -, your method should return a negative number. If no sign is given, 
you should return a positive number.
=end

# def string_to_signed_integer(string)
#   case string[0]
#   when '-' then -string_to_integer(string[1..-1])
#   when '+' then string_to_integer(string[1..-1])
#   else          string_to_integer(string)
#   end
# end

DIGITS = (0..9).map(&:to_s).zip(0..9).to_h
def string_to_signed_integer(string)
  digits = string.gsub(/[+-]/, '').chars.map { |char| DIGITS[char] }

  value = 0
  if string[0] == '-'
    digits.each { |digit| value = 10 * value - digit }
  else
    digits.each { |digit| value = 10 * value + digit }
  end
  value
end

def string_to_signed_integer2(string_number)
  digits_hash = (0..9).map(&:to_s).zip(0..9).to_h
  num_reversed = string_number.gsub(/[+-]/, '').reverse
  total = 0

  num_reversed.chars.each_with_index do |number, index|
    num_value = digits_hash[number]
    num_value_base_ten = num_value * (10**index)
    if string_number[0] == '-'
      total -= num_value_base_ten
    else
      total += num_value_base_ten
    end
  end
  total
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100


=begin
In our solution, we call string[1..-1] twice, and call string_to_integer three times.
This is somewhat repetitive. Refactor our solution so it only makes these two calls once each.
=end

def signed_one(sign)
  sign == '-' ? -1 : 1
end

def string_to_signed_integer3(num_str)
  sign = num_str.slice!(/-|\+/)
  string_to_integer(num_str) * signed_one(sign)
end


#####################

def string_to_signed_integer4(string)
  negative = true if string.start_with?("-")
  string.delete!("+-")

  negative ? -string_to_integer(string) : string_to_integer(string)
end