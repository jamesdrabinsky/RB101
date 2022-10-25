=begin
Write a method that takes a string argument and returns a new string that contains the value of the original 
string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze 
or String#squeeze!.
=end

=begin
P:
  Input: string
  Output: string

  Explicit requirements
    - Given a string 
      return a new string that contains the value of the original string with all duplicate characters collapsed
      into a single character.
    - Cannot use String#squeeze or String#squeeze!

D:
  - Input: string
  - Output: string
  - Intermediate: range (to reference each index position in string)

A:
  - Initialize a variable `new_string` which is an empty string
  - Initialize a variable call `string_range` which is a range of all numbers from 0 to string length - 1
  - Iterate through each character of the string using `string_range` to reference the index position in the string
  - On each iteration, if the character at the current index position is NOT EQUAL to the character at the current 
    index position + 1, add the character to `new_string`
  - Return `new_string`
=end

def crunch(string)
  new_string = ''
  (0..(string.size - 1)).each do |idx|
    new_string << string[idx] if string[idx] != string[idx + 1]
  end
  new_string
end

def crunch(string)
  words_deduped = string.split.map do |word|
    word.chars.select.with_index { |char, idx| char != word[idx + 1] }.join
  end
  words_deduped.join(' ')
end

def crunch(string)
  new_string = ''
  string.each_char do |char|
    new_string << char if new_string[-1] != char
  end
  new_string
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

=begin
Further Exploration
You may have noticed that we continue iterating until index points past the end of the string. 
As a result, on the last iteration text[index] is the last character in text, while text[index + 1] is nil. 
Why do we do this? What happens if we stop iterating when index is equal to text.length?
=end

# Comparing the last character to nil will always return `false`