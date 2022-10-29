=begin
Write a method that returns the next to last word in the String passed to it as an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.
=end

def penultimate(string)
  string.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

def middle_word(string)
  arr = string.split
  middle  = arr.size / 2
  arr[middle]
end

p middle_word('')
p middle_word('I')
p middle_word('I am going to the store')
p middle_word('Watch me burn')