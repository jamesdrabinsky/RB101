=begin
Write a method that takes two strings as arguments, determines the longest of the two strings,
and then returns the result of concatenating the shorter string, the longer string, and the
shorter string once again.  You may assume that the strings are of different lengths.
=end

=begin
P:
  Input: String
  Output: String

  Explicit Requirements:
    - Strings arguments will be different lengths
    - Concatenate the strings like: short + long + short

  Implicit Requirements:
    - String can be empty

D:
  Input: String
  Output: String

A:
  - Sort the strings by length and assign the variables to the return value
  - Concatenate the shorter string with the longer string and then concatenate the shorter string.

C:
=end

# def short_long_short(string1, string2)
#   if string1.length > string2.length
#     string2 + string1 + string2
#   else
#     string1 + string2 + string1
#   end
# end

def short_long_short(string1, string2)
  short, long = [string1, string2].sort_by(&:length)
  short + long + short
end

p short_long_short('abc', 'defgh') == 'abcdefghabc'
p short_long_short('abcde', 'fgh') == 'fghabcdefgh'
p short_long_short('', 'xyz') == 'xyz'
