=begin
Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. 
Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.
=end

=begin
P:
  Input: array
  Output: array

  Explicit  requirements:
    - Given an array
    - Return a new array with the elements of the original array in reverse order.
    - Do not use built-in methods or the method you wrote in the previous exercise

D:
  Input: arrays
  Output: array

A:
  - Initialize an empty array called `new_array`
  - Iterate through the original array
    - On each iteration, append the current elements negative index position - 1
  - Return the new array
=end

def reverse(arr)
  arr.map.with_index(1) { |_, idx| arr[-idx] }
end

def reverse(arr)
  (arr.size - 1).downto(0).map { |idx| arr[idx] }
end

def reverse(arr)
  arr.each_with_object([]) { |v, res| res.unshift(v) }
  arr.inject([]) { |array, i|  array.unshift(i) }
end


p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true