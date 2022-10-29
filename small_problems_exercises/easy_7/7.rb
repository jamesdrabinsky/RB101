=begin
Write a method that takes an Array of integers as input, multiplies all 
the numbers together, divides the result by the number of entries in the Array, 
and then prints the result rounded to 3 decimal places. Assume the array is non-empty.
=end

=begin
P:
  Input: array
  Output: float

  Explicit requirements:
    - Given a string
    - Return a float which represents the result of all the integers multiplied together
    divided by the number of entries
    - Print the result rounded to 3 decimals places.

D:
  Input: array
  Output: float

A:
  - Multiply all elements of the argument array
  - Divide the result by the length of the array
  - Convert the float to a string and format it to 3 decimals.
=end

def show_multiplicative_average(arr)
  res = arr.reduce(:*).to_f / arr.size
  # puts format('%.3f', res.to_s)
  puts "#{'%.3f' % res}"
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667