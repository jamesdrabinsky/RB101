=begin
Write a method that determines and returns the ASCII string value of a string that is passed in as an argument.
The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to
determine the ASCII value of a character.)
=end

=begin
P:
  - Input: string
  - Output: integer

  - Explicit requirements:
    - Return the sum of all all character's ASCII values in a string
    - Allowed to use String#ord

  - Implicit Requirements
    - Empty string will return value of 0
    - All characters in string will be alpha characters?

D:
  - Input: string
  - Intermediary: array
  - Output: integer

A:
  - Initialize a variable 'total' and set it equal to 0
  - Convert string into array
  - Iterate through the array and add each character's ASCII value to the total
  - Return value of total
=end

def ascii_value(string)
  string.chars.reduce(0) { |total, char| total += char.ord }
end

def ascii_value(string)
  string.chars.sum(&:ord)
end

def ascii_value(string)
  n = string.size - 1
  (0..n).reduce(0) { |total, idx| total += string[idx].ord }
end

def ascii_value(string)
  n = string.size - 1
  (0..n).sum { |idx| string[idx].ord }
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

=begin
There is an Integer method such that:

char.ord.mystery == char

where mystery is our mystery method. Can you determine what method name should be used in place of mystery? 
What happens if you try this with a longer string instead of a single character?
=end

s = 'c'
p s.ord.chr == s

# If string is more than one character then String#ord will return the first character