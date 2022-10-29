=begin
Write a method that takes a string as an argument and returns a new string in which every uppercase 
letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. 
All other characters should be unchanged.
=end

=begin
P:
  Input: string
  Output: string

  Explicit requirements
     - Given a string
     - Return a new string in which every uppercase character is replaced by its lowercase version
     and every lowercase character is replaced by its uppercase version
     - All other characters should be unchanged.

D:
  Input: string
  Output: string
  Intermediate: empty string

A:
  - Initialize local variable `swapped` which references an empty string object
  - Iterate through each index position of the string
    - If the character at the current index position is uppercase, convert it to lowercase append it to `swapped`
    - If the character at the current index position is lowercase, convert it to uppercase and append it to `swapped`
    - else, append the character at the current index position to `swapped`
  - Return `swapped`
=end

def swapcase(string)
  swapped = ''
  (0..string.size - 1).each do |idx|
    if string[idx].match?(/[A-Z]/)
      swapped << string[idx].downcase
    elsif string[idx].match?(/[a-z]/)
      swapped << string[idx].upcase
    else
      swapped << string[idx]
    end
  end
  swapped
end

def swapcase(string)
  swapped_arr = string.chars.map do |char|
    if char.match?(/[A-Z]/)
      char.downcase
    elsif char.match?(/[a-z]/)
      char.upcase
    else
      char
    end
  end
  swapped_arr.join
end

# def swapcase(string)
#   characters = string.chars.map do |char|
#     if char =~ /[a-z]/
#       char.upcase
#     elsif char =~ /[A-Z]/
#       char.downcase
#     else
#       char
#     end
#   end
#   characters.join
# end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'