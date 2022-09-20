=begin
Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.
=end

=begin
P:
  Given a number 
  return all of the digits in the number in an array

  Input: integer
  Ouput: Array of integers

  Explicit requirements:
    The will always be one argument
    The integer is positive
    Returns a list of integers

  Implicit requirements:
    ...

E:
  puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
  puts digit_list(7) == [7]                     # => true
  puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
  puts digit_list(444) == [4, 4, 4]             # => true

D:
  Input: integer
  Interim: not needed
  Output: array of integers

A:
  Convert the integer to a string.
  Add each character of the string to a list.
  Convert list items back to integers

C:
=end

def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

def digit_list(number)
  digits = []
  loop do
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
    break if number == 0
  end
  digits
end


print digit_list(12345)
print "\n"
print digit_list(7)
print "\n"
print digit_list(375290)
print "\n"
print digit_list(444)