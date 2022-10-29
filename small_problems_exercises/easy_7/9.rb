=begin
Write a method that takes two Array arguments in which each Array contains a list of numbers, 
and returns a new Array that contains the product of every pair of numbers that can be formed 
between the elements of the two Arrays. The results should be sorted by increasing value.

You may assume that neither argument is an empty Array.
=end

=begin
P:
  Input: two arrays
  Output: array

  Explicit requirements:
    - Given two arrays
    - Return an array with the products of all possible combinations of the two arrays
    - The ressults should be sorted.

A:

=end

def multiply_all_pairs(arr1, arr2)
  combos = arr1.each_with_object([]) do |num1, array|
    arr2.each do |num2|
      array << num1 * num2
    end
  end
  combos.sort
end

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |sub_arr| sub_arr.reduce(:*) }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]