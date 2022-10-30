=begin
Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. 
You may assume that the Array always contains at least one number.
=end

=begin
P:
  Input: array
  Output: integer

  Explicit requirements:
    - Given an array of integers
    - Return the sum of sums of each leading subsequence for that array.
    - All arrays have at least one number

A:
  - Initialize a local variable `total` to value 0
  - Iterate through a range of numbers from 0 to the array length - 1
    - On every iteration, get the sum of the subsection of the array from 0 to the number in the current iteration.
  - Once you've iterated through all numbers in the range, return total
=end

def sum_of_sums(arr)
  (0..arr.size - 1).reduce(0) do |total, idx|
    total += arr[0..idx].sum
  end
end

# def sum_of_sums(numbers)
#   sum_total = 0
#   accumulator = 0

#   numbers.each do |num|
#     accumulator += num
#     sum_total += accumulator
#   end

#   sum_total
# end


p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35