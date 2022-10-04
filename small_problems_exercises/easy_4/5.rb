=begin
Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number,
and then computes the sum of those multiples. For instance, if the supplied number is 20, the result
should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.
=end

=begin
P:
  Input: Integer
  Output: Integer

  Explicit Requirements:
    - The integer argument is greater than 1
  
  Implicit Requirements:
    - The passed argument can be included in the list of multiples.

D:
  Input: Integer
  Output: Integer
  Intermediate: An array to store the multiples of 3 and 5

A:
  - Iterate through every numbers in between 1 and the integer argument
  - Store each numbe that is a multiple of 3 and 5 in a new array
  - Once iteration is complete get the sum of the new array

C:
=end

def multisum(number)
  (1..number).select { |i| (i % 3 == 0) || (i % 5 == 0) }.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168