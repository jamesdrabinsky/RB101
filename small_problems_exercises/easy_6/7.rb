=begin
Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) 
that contain the first half and second half of the original Array, respectively. If the original array 
contains an odd number of elements, the middle element should be placed in the first half Array.
=end

=begin
P:
  Input: array
  Output: nested array

  Explicit requirements:
    - Given an array
    - Return two arrays (as a pair of nested arrays) that contain the first half
    and second half of the original array, respectively.  
    - If the original array has an odd numbers of elements, the middle number should be placed in the first half array.

  Implicit requirements:
     - If the original array is empty, the method should return two empty array within an outer array.
     - If the original array has one elements, the method should return one array with the single element and a 
     an empty array inside an outer array.

D:
  - Input: array
  - Output: nested array

A: 
  - Iniitalize a local variable `middle`
    - `middle` is equal to half the array size if the array has an even number of elements
    - `middle` is equal to half the array size plus 1 if the array has an odd number of elements
  - Split the array at the index position that `middle references.  
  
=end

def halvsies(arr)
  return [[], []] if arr.size.zero?
  
  middle = (arr.size.to_f / 2).ceil
  split_arr = [*arr.each_slice(middle)]
  split_arr << [] if split_arr.size < 2
  split_arr
end

# def halvsies(array)
#   middle = (array.size / 2.0).ceil
#   first_half = array.slice(0, middle)
#   second_half = array.slice(middle, array.size - middle)
#   [first_half, second_half]
# end

def halvsies(array)
  array.partition.with_index { |_, i| i < (array.size / 2.0).ceil }
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]