=begin
Write a method that takes an integer as argument, and returns the maximum rotation of that argument. 
You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.
=end

=begin
P:
  Input:integer
  Output: integer

  Explicit requirements:
    - Given an integer argument
    - Rreturn the maximum rotation of that argument

D:
  Input:integer
  Output: integer
  Intermediate: array

A:
  - Convert the integer argument to a string
  - Initialize local variable n, which is equal to the string integer length - 1
  - Initiate a loop and pass a block to it which rotates the characters in the string integer n number of times
  - Return the integer after the loop is complete.
=end

def max_rotation(int)
  arr = int.to_s.split('')
  (arr.size - 1).times do |idx|
    first, last = arr.partition.with_index { |_, v| v == idx }
    arr = last + first
  end
  arr.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845