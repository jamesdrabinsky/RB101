=begin
Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. 
The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.
=end

=begin
P:
  Input: array
  Output: Same array

  Explicit requirements:
    - Given an array
      Return the same array with its elements reversed.
    - You cannot use Array#reverse or Array#reverse!.

D:
  Input: array
  Output: same array

A:
  - Initialize a variable `mid` which represents the middle index position of an array
  - Initialize variables `start_` and `end_` which will be index position 0 and index position array length - 1
  - While start < end:
    - swap elements at start and end positions
  - Implicitly return the original array
=end

def reverse!(arr)
  start_, end_ = 0, arr.size - 1

  while start_ < end_
    arr[start_], arr[end_] = arr[end_], arr[start_]
    start_ += 1
    end_ -= 1
  end
  arr
end


def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end

list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
reverse!(list) == [] # true
p list == [] # true

=begin
Note that our solution here has both a side-effect (in mutating the array passed in to the method) 
and a meaningful return value (it returns the mutated array). Generally, this would be seen as 
bad practice (you want your methods to have either a side-effect, or a meaningful return value).
=end