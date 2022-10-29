=begin
Write a method that takes a String as an argument, and returns a new String 
that contains the original value using a staggered capitalization scheme in 
which every other character is capitalized, and the remaining characters are lowercase. 

Characters that are not letters should not be changed, but count as characters when switching 
between upper and lowercase.
=end

=begin
P:
  Input: string
  Output: original string

  Explicit requirements:
     - Given a string
     - Return the same string with every other character capitalized
     and the rest of the characters lowercase
     - Characters that are not letters should not be changed, but do count as 
      characters when switching between upper and lowercase.

D: 
  Input: string
  Output: original string

A:
  - Iterate through the string
      - If the current index position is an even number, convert the character at that index to uppcase
      - Else convert the character at the index position to lowercase
  - Return the original string

=end

def staggered_case(string)
  (0..string.size - 1).each do |idx|
    idx.even? ? string[idx] = string[idx].upcase : string[idx] = string[idx].downcase
  end
  string
end

# NOT SAME STRING
# def staggered_case(string)
#   arr = string.chars.each_with_index do |char, idx|
#     idx.even? ? char.upcase! : char.downcase!
#   end
#   arr.join
# end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'