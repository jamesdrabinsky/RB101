=begin
Write a method that takes one argument, a string, and returns a new string with the words in reverse order.
=end

=begin
P:
  Given a string
  Return a new string with characters in the original string in reverse order

  Input: string
  Output: string

E: 
  puts reverse_sentence('Hello World') == 'World Hello'
  puts reverse_sentence('Reverse these words') == 'words these Reverse'
  puts reverse_sentence('') == ''
  puts reverse_sentence('    ') == '' # Any number of spaces results in ''

D: 
  Input: string
  Interim: Add each word in a list
  Output: Join words in a list together in a string

A: 
  Add each space delimited character in the string to a list
  Reverse the list
  Join the characters in the reversed list back together separated by a space 
  in a string

C:  
=end

def reverse_sentence(words)
  words.split.reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''