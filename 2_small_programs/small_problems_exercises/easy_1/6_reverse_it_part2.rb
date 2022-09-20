=begin
Write a method that takes one argument, a string containing one or more words, 
and returns the given string with words that contain five or more characters reversed. 
Each string will consist of only letters and spaces. Spaces should be included 
only when more than one word is present.
=end

=begin
P:
  Given a string
  Return a new string with words containing five or more characters reversed

  Input: string
  Output: string

E:
  reverse_words('Professional')  # => lanoisseforP
  reverse_words('Walk around the block') # => Walk dnuora the kcolb
  reverse_words('Launch School')         # => hcnuaL loohcSs

D:
  Input:string
  Interim: Convert string to an array and reverse all strings with more than 
  five characters in the array
  Output: Convert array but to string with each character separaed by a space

A:
  Convert the string into a list
  Reverse each character in the list containing five or more characters
  Join the list items back together in a space-delimited string

C:
=end

# def reverse_words(string)
#   words = []

#   string.split.each do |word|
#     word.reverse! if word.size >= 5
#     words << word
#   end

#   words.join(' ')
# end

def reverse_words(words)
  words.split.map { |word| word.size >= 5 ? word.reverse : word }.join(' ')
end

def reverse_words2(str)
  str.split(' ').each { |word| word.reverse! if word.size >= 5 }.join(' ')
end


puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS