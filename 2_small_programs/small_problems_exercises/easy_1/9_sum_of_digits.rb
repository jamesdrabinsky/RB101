=begin
Write a method that takes one argument, a positive integer, and returns the sum 
of its digits.
=end

=begin
P:
  Given a positive integer
  Return the sum of its digits

  Input: Integer
  Output: Integer

E:
  puts sum(23) == 5
  puts sum(496) == 19
  puts sum(123_456_789) == 45

D:
  Input: Integer
  Interim: Store each of the number's digits in an array
           Get the sum of the array
  Output: Integer

A:
  Convert the integer to a string
  Store each of the characters in the string in an array
  Convert all array items to integers
  Get the sum of the array

C:
=end

def sum(number)
  number.to_s.chars.map(&:to_i).sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
