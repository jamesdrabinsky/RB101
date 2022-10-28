=begin
Write a method named include? that takes an Array and a search value as arguments. 
This method should return true if the search value is in the array, false if it is not. 
You may not use the Array#include? method in your solution.
=end

=begin
P:
  Input: array
  Output: boolean

  Explicit requirements:
    - Given an array of integers and a search value
    - Return true if the search value appears in the array, false otherwise
    - You cann use Array#include

D:
  Input: array
  Output: boolean

A:
  - Iterate through the array
    - Explcitly return true if value in the current iteration is equal to the search value
  - If none of the iterations return a true value, implicitly return false 
=end

def include?(arr, search)
  arr.each do |num|
    return true if num == search
  end
  false
end

def include?(arr, search)
  arr.select { |num| num == search }.empty?
end

def include?(arr, search)
  !!arr.find_index(search)
end



p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false