=begin
Given the array...

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

Write a program that prints out groups of words that are anagrams. 
Anagrams are words that have the same exact letters in them but in a different order. 
Your output should look something like this:

["demo", "dome", "mode"]
["neon", "none"]
#(etc)
=end

=begin
P:
  Input: array
  Output: array of arrays (nested data structure)

  Explicit requirements:
    - Given an array of strings
    - Return a array of arrays.  The nested arrays represent groups of words that are anagrams.

A:
  - Method `get_count`
    - This method will return a hash with the characters as keys and their counts as values.

  - Method `anagrams`
    - Initialize a local variable `groups` which will be an empty hash with a default value of an empty array
    - Iterate through the argument array
      - Apply the `get_count` method to each element
        -  Add it to the array in `groups` associated with the key that is returned by `get_count`
    - Return the values from `groups` in an array
=end

def get_count(string)
  string.chars.tally
end

def anagrams(arr)
  groups = Hash.new { |h, k| h[k] = [] }
  arr.each do |word|
    count = get_count(word)
    groups[count] << word
  end
  groups.values.select { |group| group.size > 1 }
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

p anagrams(words)