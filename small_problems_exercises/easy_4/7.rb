=begin
Write a method that takes a String of digits, and returns the appropriate number as an integer.
You may not use any of the methods mentioned above.
=end

=begin
P:
  - Input: String
  - Output: Integer

  Explicit Requirements:
    - Cannot use Integer or to_i methods.
    - All characters in the string will be numeric.
  
  Implicit Requirements:
    - ...

D:
  Input: String
  Output: Numberic
  Intermediate: 
    - Array to store numeric value
    - Dictionary to match numeric strings with numbers

A: 
  - Initalize a hash (digits_hash) which pairs all numbers from 0 to 9 with their string representations.
  - Initalize a variable (num_reversed) which reversed the string integer
  - Initialzie a variable total and set it to 0
  - 

=end

# DIGITS = (0..9).map(&:to_s).zip(0..9).to_h
# def string_to_integer(string)
#   digits = string.chars.map { |char| DIGITS[char] }

#   value = 0
#   digits.each { |digit| value = 10 * value + digit }
#   value
# end

def string_to_integer(string_number)
  digits_hash = (0..9).map(&:to_s).zip(0..9).to_h
  num_reversed = string_number.reverse
  total = 0

  num_reversed.chars.each_with_index do |number, index|
    num_value = digits_hash[number]
    num_value_base_ten = num_value * (10**index)
    total += num_value_base_ten
  end
  total
end

# digits_hash = (0..9).each_with_object({}) { |value, hsh| hsh[value] = value.to_s}

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570


hash1 = (0..9).map(&:to_s).zip(0..9).to_h
hash2 = ('A'..'F').zip(10..16).to_h
HEX_HASH = hash1.merge(hash2)

def hexadecimal_to_integer(string)
  chars = string.chars.map { |char| HEX_HASH[char.upcase] }

  value = 0
  chars.each { |char| value = 16 * value + char } 
  value
end

p hexadecimal_to_integer('4D9f') == 19871


