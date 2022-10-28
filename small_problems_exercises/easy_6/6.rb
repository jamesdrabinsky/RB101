=begin
Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. 
There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.
=end

=begin
P:
  Input: two arrays
  Output: array

  Explicit requirements:
    - Given two arrays
    - Return a new array that contains all of the values from the argument arrays
    but without any duplicates

D:
  Input: two arrays
  Output: array
  Intermediate: array

A:
  - Initialize a variable `new_arr` that references an empty array object
  - Iterate through each argument array
    - If the element at the current index position does not exist in the array,
    append it to `new_arr`
  - Return `new_arr`
=end

def merge(*arrays)
  arrays.each_with_object([]) do |sub_arr, new_arr|
    sub_arr.each do |elem|
      new_arr << elem unless new_arr.include?(elem)
    end
  end
end

# def merge(array_1, array_2)
#   array_1 | array_2
# end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
