# 1. A method that returns the sum of two integers

# Casual:

# Given two integers
# save a value as the result of adding the first integer to the second integer
# return the saved value

# Formal:

# START
# Given two integers called num1 and num2

# SET result = num1 + num2

# PRINT result

# END

def add(num1, num2)
  num1 + num2
end

# 2. A method that takes an array of strings, and returns a string that is all those strings concatenated together

# Casual: 

# Given an array of strings
# save a value as the result of combining all strings in an array together in a single string
# return the saved value

# Formal:

# START
# Given a collection of strings called "strings"

# SET joined_string = result of joining strings in a single string each separated by a space

# PRINT joined_string

# END

def join_strings(arr)
  arr.join(' ')
end

# 3. a method that takes an array of integers, and returns a new array with every other element from the original array, 
# starting with the first element. For instance:

# everyOther([1,4,7,2,5]) # => [1,7,5]

# Casual:

# Given an array of integers
# save a new array with every other element from the original array
# return the new array

# Formal

# START
# Given an array of integers called "numbers"

# SET even_indexes as a new array containing only the numbers at even_indexes

# PRINT even_indexes

# END

def every_other(numbers)
  numbers.select { |num| numbers.index(num).even? }
end

def every_other2(numbers)
  numbers.select.with_index { |_, index| index.even? }
end

# 4. A method that determines the index of the 3rd occurrence of a given character in a string. 
# For instance, if the given character is 'x' and the string is 'axbxcdxex', the method should 
# return 6 (the index of the 3rd 'x'). If the given character does not occur at least 3 times, return nil.

# Casual:

# Given a string and a target character within the string
# Initialize a counter and set it to 0
# Iterate through the string one character at a time
# Increment the counter by 1 every time the string is equal to the target character
# When the counter reaches 3 record the position of the third occurence of the target character
# Return that position

# Formal:

# Given a string names "string"
# Given a target character within the string

# SET iterator = 0

# READ each character in the string along with its position
# IF a character is equal to the target character increment the iterator by 1
# WHEN the iterator equals 3 STOP reading the string

# PRINT position

# END

def third_occurence(string, target)
  counter = 0

  string.chars.each_with_index do |char, idx|
    counter += 1 if char == target
    break idx if counter == 3 
    if idx == string.size - 1
      return "There are not three occurences of #{target} in #{string}!" 
    end 
  end
end

# 5. A method that takes two arrays of numbers and returns the result of merging the arrays. 
# The elements of the first array should become the elements at the even indexes of the returned array, 
# while the elements of the second array should become the elements at the odd indexes. For instance:

# merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]

# Casual:

# Given two collections of numbers
# Save a new empty array
# Iterate through each collection 
# On each iteration save an element of each collection to the new array 
# After iteration throug both collections return the new array

# Formal:

# Given two integer arrays of equal length

# SET arr3 = []

# READ each element of the first array along with its positions
# upon each iteration add a number from arr1 and the number from arr2 at the corresponding position

# WHEN iteration of arr1 is complete PRINT arr3

# END

def merge(arr1, arr2)
  arr3 = []
  arr1.each_with_index do |num, idx|
    arr3 << num
    arr3 << arr2[idx]
  end
  arr3
end

def merge2(arr1, arr2)
  arr1.zip(arr2).flatten
ends