=begin
Create a method that takes two arguments, multiplies them together, and returns the result.
=end

def multiply(*nums)
  nums.reduce(:*)
end

puts multiply(5, 3)
puts multiply(2, 10, 2)
puts multiply(0, 10)

# If the firsdt argument was an array, the items in the array would be copied n (argument 2) number of times,