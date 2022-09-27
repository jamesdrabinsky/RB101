=begin
Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. 
The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.
=end

=begin
P:
  Given an array of integers
  Return the average of all numbers in the array
  
  Input: 
    array of integers
    Integers will always be positive (> 0)
    Array will never be empty

  Output: Integer

E:

  puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
  puts average([1, 5, 87, 45, 8, 8]) == 25
  puts average([9, 47, 23, 95, 16, 52]) == 40

D:
  Input: arr
  Internim: not necessary
  Output: integer

A:
  Get the sum of the numbers in the array
  Divide the sum by the size/length/count of the array
  Return the quotient in integer form

C:
=end

# def average(numbers)
#   sum = numbers.reduce { |sum, number| sum + number }
#   sum / numbers.count
# end

def average(arr)
  arr.sum / arr.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

=begin
Further Exploration
Currently, the return value of average is an Integer. When dividing numbers, sometimes the quotient isn't a whole number, 
therefore, it might make more sense to return a Float. Can you change the return value of average from an Integer to a 
Float?
=end

def average(arr)
  arr.sum.to_f / arr.size
end

puts average([1, 6]) 
puts average([1, 5, 87, 45, 8, 8]) 
puts average([9, 47, 23, 95, 16, 52])