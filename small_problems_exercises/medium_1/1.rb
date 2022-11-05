=begin
Write a method that rotates an array by moving the first element to the end of the array. 
The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.
=end

def rotate_array(arr)
  first, second = arr.partition.with_index { |_, i| i == 0}
  second.concat(first)
end

def rotate_array(arr)
  arr[1..] + [arr[0]]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true


=begin
Further Exploration
Write a method that rotates a string instead of an array. 
Do the same thing for integers. You may use rotate_array from inside your new method.
=end

def rotate_string(string)
  string[1..] + string[0]
end

def rotate_integer(int)
  (int.to_s[1..] + int.to_s[0]).to_i
end