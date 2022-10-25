=begin
Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, 
write a method that returns that string with all of the non-alphabetic characters replaced by spaces. 
If one or more non-alphabetic characters occur in a row, you should only have one space in the result 
(the result should never have consecutive spaces).
=end

=begin
P:
  Input: string
  Output: string

  Explicit requirements:
    - Give a string with all lowercased characters return a string with all non-alphabetic characters
      replaced by spaces.
    - If one or more non-alphabetic characters occur in a row, you should only have one space in the return string

  Implicit requirements:
    - Should the method return a new string or the mutated original strings 

D:
  Input: string
  Output: string

A:
  - Initialize a variable 'last' and set it to ''
  - Iterate through a range of numbers from 0 to the string length - 1
  - If the character at the current index position is non-alphabetic then update 'last' with that index position
  - If the character at the current index position is non-alphabetic replace it with a space ONLY IF 'last' is not equal
    to the current index position - 1
=end

def cleanup(string)
  last = ''
  new_string = ''
  (0..(string.size - 1)).each do |idx|
    if string[idx].match?(/[^a-z]/)
      new_string << ' ' if last != idx - 1
    else
      new_string << string[idx]
    end
    last = idx if string[idx].match?(/[^a-z]/)
  end
  new_string
end

p cleanup("---what's my +*& line?") == ' what s my line '
