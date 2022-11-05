=begin
A featured number (something unique to this exercise) is an 
  - odd number 
  - that is a multiple of 7, 
  = and whose digits occur exactly once each. 
  
So, for example, 
  49 is a featured number, 
  but 98 is not (it is not odd), 
  97 is not (it is not a multiple of 7), 
  and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, 
and returns the next featured number that is greater than the argument. 
Return an error message if there is no next featured number.
=end

=begin
P:
  Input: integer
  Output: integer or error message

  Explicit requirements:
     - Given an integer
     - Returns the next featured number that is greater than the argument
     - Returns the error message if there is no next featured number

D:
  Input: integer
  Output: integer or error message
  Intermediate: range
=end

MESSAGE = 'There is no possible number that fulfills those requirements.'.freeze

def featured?(number)
  str_num = number.to_s.chars
  (number.odd?) && (number % 7 == 0) && (str_num.size == str_num.uniq.size)
end

def featured(number)
  ((number + 1)..).each do |num|
    return num if featured?(num)
    return MESSAGE if num >= 9_876_543_210
  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements