=begin
Write a method that takes an Array of numbers, and returns an Array with the same number of elements,
and each element has the running total from the original Array.
=end

=begin
P:
  Input: array of integers or empty
  Output: Array of integers or empty

  Explicit Requirements:
    - The return value must be the same length as the original array
  
  Implicit Requirements:
    - Each value in the new array will be equal to or greater than its corresponding element in the original array

D:
  Input: Array
  Output: Array
  Intermediate: Array to store new values

A:
  - Initialzie variable n which is equal to the length of the original array
  - Initalize a count variable and set it to 0
  - Initalize a variable running_sum which is equal to an empty list
  - Iterate through the array n number of times and on each iteration
    - Store the sum of a slice of the array from (index 0 to count) in running_sum
    - increment count by 1

C:
=end

# def running_total(array)
#   sum = 0
#   array.map { |value| sum += value }
# end

def running_total(arr)
  n = arr.size
  n.times.map { |idx| arr[..idx].sum }
end

def running_total2(arr)
  n = arr.size
  running_sum = []

  n.times { |idx| running_sum << arr[..idx].sum }
  running_sum
end

def running_total3(arr)
  sum = 0
  arr.each_with_object([]) do |value, list|
    sum += value
    list << sum
  end
end

def running_total4(arr)
  arr.each_with_object([0]).map { |value, list| list[0] += value }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
