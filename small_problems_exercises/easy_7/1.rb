=begin
Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains 
all elements from both Array arguments, with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same number of elements.
=end

=begin
P:
  Input: multiple arrays
  Output: array

  Explicit requirements
    - Given two arrays
    - Return a single array which combines the elements from both arrays
    with the elements taken in alteration
    - Arrays will have the same number of elements

D:
  Input: multiple arrays
  Output: array

A:
  - Initialize a local variable `combined` which references an empty array
  - Iterate over a range from 0 to array.size - 1 and take the element at each index position 
  and append it to `combined`
=end

interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

def interleave(*arrays)
  (0..arrays[0].size - 1).each_with_object([]) do |idx, arr|
    arrays.each { |sub_arr| arr << sub_arr[idx] }
  end
end

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end