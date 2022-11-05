=begin
Write a method that takes a string as an argument, 
and returns true if all parentheses in the string are properly balanced, 
false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.
=end

=begin
P:
  Input: String
  Output: Boolean

  Explciit requirements:
    - Given a string argument
    - Return true if all the parentheses in the string are properly balanced, false otherwise.
    - To be properly balanced, parentheses must occur in matching '(' ')' pairing
    =end

D:
  Input: String
  Output: Boolean
  Intermediate: Array

A:
  - Initialize a variable `closures` to an empty array object
  - Convert the string argument to an array
    - On eeach iteration
       - If the character is ')' and `closures` is empty, return false
       - else, if the character is '(' add it to `closures`
       - else, if the character is ')' pop `closures`
  - Return true of `closures` is empty at the end of the method.
=end

def balanced?(string)
  closures = []
  string.chars.each do |char|
    if char == ')' && closures.empty?
      return false
    elsif char == '('
      closures << '('
    elsif char == ')'
      closures.pop
    end
  end
  closures.empty?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false