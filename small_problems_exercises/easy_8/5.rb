=begin
Write a method that returns a list of all substrings of a string that are palindromic. 
That is, each substring must consist of the same sequence of characters forwards as it does backwards. 
The return value should be arranged in the same sequence as the substrings appear in the string. 
Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case; that is, 
"AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters 
are not palindromes.
=end

=begin
P:
  input: string
  output: array

  Explicit requirements:
    - Given a string
    - Return a list of all substrings of the string that are palindromic
    - When determining what constitutes a palindrome, case does matter.

A:
  - Initialize a local variable `pals` to an empty array object
  - Iterate through a range of numbers from 0 to the string length - 1 with (idx1)
    - Iterate through a range of numbers from idx1 + 1 to string length - 1 with (idx2)
      - Take a slice of the string from idx1 to idx2, inclusive
      - If the substring is the same as when its reversed, add it to `pals`
  - Return `pals`

=end

def palindromes(string)
  (0..string.size - 1).each_with_object([]) do |idx1, pals|
    (idx1 + 1..string.size - 1).each do |idx2|
      current_str = string[idx1..idx2]
      pals << current_str if current_str == current_str.reverse
    end
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

=begin
Further Exploration
Can you modify this method (and/or its predecessors) to ignore non-alphanumeric characters and case? 
Alphanumeric characters are alphabetic characters(upper and lowercase) and digits.
=end

def palindromes(string)
  alpha_nums = string.delete('^A-Za-z1-9').downcase

  (0..alpha_nums.size - 1).each_with_object([]) do |idx1, pals|
    (idx1 + 1..alpha_nums.size - 1).each do |idx2|
      current_str = alpha_nums[idx1..idx2]
      pals << current_str if current_str == current_str.reverse
    end
  end
end