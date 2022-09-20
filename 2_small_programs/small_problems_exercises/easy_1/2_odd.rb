=begin
Write a method that takes one integer argument, which may be positive, negative, or zero. 
This method returns true if the number's absolute value is odd. You may assume that the argument 
is a valid integer value.
=end

=begin
P:
  receive a number, determine if the absolute value of the number is odd.
  return a boolean

  Inputs: interger
  Output: boolean

  Explicit requirements:
    Take in one integer argument
    The argument can be positive, negative, or zero
    Return true if the number's absolute value is odd
    Assume argument is a valid integer

  Implicit requirements:
    0 considered an even number
    Method returns false if the integer is even

E:
  ...

D: 
    Input: integer
    Interim: Not needed
    Output: boolean

A:
  If the number modulo two is 1 then return true else return false

C:
=end

def is_odd?(number)
  number % 2 == 1
end

puts is_odd?(-19)
puts is_odd?(0)
puts is_odd?(4)