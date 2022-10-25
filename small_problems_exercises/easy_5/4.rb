=begin
Given a string of words separated by spaces, write a method that takes this string of words and returns a string
in which the first and last letters of every word are swapped.

You may assume that every word contains at least one letter, and that the string will always contain at least one word.
You may also assume that each string contains nothing but words and spaces
=end

=begin
P:
  - Input: string
  - Output: string

  - Explicit requirements:
    - Return a string in which the first and last letters of every word are swapped
    - Every word contains at least one letter
    - The string will contain at least one word]
    - Each string contains only words and spaces

D:
  - Input: string
  - OutputL string
  - Intermediate: array

A:
   - Write method called 'swap' which accepts a string with one word
       - This method will initialize two variables - first and last
       - It will then assign the character at the first index position of the string argument with last
         and the character at the last index position of the wioth first
    - Convert the string argument to an array
    - Apply the 'swap' method to each element of the array
    - Convert the array back to a string
=end

def single_swap(string)
  string[-1], string[0] = string[0], string[-1]
  string
end

def swap(string)
  string.split.map { |char| single_swap(char) }.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

=begin
Further Exploration
How come our solution passes word into the swap_first_last_characters method invocation instead of just passing 
the characters that needed to be swapped? Suppose we had this implementation:

def swap_first_last_characters(a, b)
  a, b = b, a
end

and called the method like this:

swap_first_last_characters(word[0], word[-1])
=end

# This method will only return the last and first letters of a string in an array.
# So when you apply it to each element string argument of the swap method it will return
# The last and first letters of each word in an array.