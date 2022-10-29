=begin
Write a method that takes a single String argument and returns a new string that contains the original 
value of the argument with the first character of every word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.
=end

=begin
P:
  Input: string
  Output: string

  Explicit requirements:
    - Given a string
    - Return a new string that contains the original value argument with the first 
    characters of every word capitalized and all others lowercase
  
  Implicit requirements:
    - In cases where the first letter of a word is non-alphabetic, should we still capitalize?

D:
    Input: string
    Output: string

A:
  - Convert the string into an array 
  - Capitalize each element in the array
  - Join the array elements back into a string
=end

def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

=begin
Ruby conveniently provides the String#capitalize method to capitalize strings. 
Without that method, how would you solve this problem? Try to come up with at least two solutions.
=end

CAPITALS = ('a'..'z').zip('A'..'Z').to_h

def word_cap(string)
  words = string.split.map do |word|
    CAPITALS.fetch(word[0], word[0]) + word[1..].chars.map(&:downcase).join
  end
  words.join(' ')
end