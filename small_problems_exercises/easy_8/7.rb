=begin
Write a method that takes a string, and returns a new string in which every character is doubled.
=end

=begin
P:
  Input: string
  Output: string

  Explicit requierements
     - Given a string 
     - Return a new string in which every character is doubled

D:
  Input: string
  Output: string
  Intermediate: array

A;
  - Initialize local variable `characters` to an empty array object
  - Convert the string to an array
  - Iterate through the array
   - On every iteration, add the current character to `characters` twice
  - Once the iteration is done, join the elements in `characters` into a string
  - Return the string
=end

def repeater(string)
  string.chars.map { |char| char * 2 }.join
end

def repeater(string)
  characters = ''
  string.chars.each do |char|
    characters << char * 2
  end
  characters
end

# def repeater(string)
#   result = ''
#   string.each_char do |char|
#     result << char << char
#   end
#   result
# end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''