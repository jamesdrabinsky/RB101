=begin
Write a method that takes a sentence string as input, 
and returns the same string with any sequence of the words 
'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' 
converted to a string of digits.
=end

=begin
P:
  Input: string
  Output: string

  Explicit requirements:
    - Given a string
    - Return the same string with any sequence of the words ... converted to a string of digits

D: 
  Input: string
  Output: string
  Intermediate: hash

A:
  - Initialize a constant variable INTEGERS which pairs the words from 'zero' to 'nine' with their related integers
  - Convert the string to an array
  - Iterate through the array
     - On each iteration, fetch the value from INTEGERS that is associated with the current word; if that word is not a key in INTEGERS,
  return the word.
  - Join the transformed array into a string.
  - Return the string
=end

INTEGERS = %w[zero one two three four five six seven eight nine].zip(0..9).to_h
# %w(zero one two three four five six seven eight nine).each_with_index.to_h

def word_to_digit(string)
  words = string.split.map do |word|
    if word.end_with?('.')
      no_punc = word.gsub('.', '')
      INTEGERS.fetch(no_punc, no_punc).to_s + '.'
    else
      INTEGERS.fetch(word, word)
    end
  end
  words.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'