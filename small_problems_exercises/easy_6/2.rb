=begin
Write a method that takes an array of strings, and returns an array of the same string values, 
except with the vowels (a, e, i, o, u) removed.
=end

=begin
P:
  Input: array
  output: array

  Explicit requirements:
    - Given an array of strings
    - Return a (new?) array of the same strings values with the values removed

  Implicit requirements:
    - Should the original array be modified or should a new array be returned?

D:
  Input: array
  Output: array

A: 
  - Initialize an empty array `vowels_removed`
  - Iterate through the original array
    - On each iteration, append the string value with no vowels to the `vowels_removed` array
  - Return `vowels_removed`
=end

def remove_vowels(arr)
  arr.map do |word|
    word.delete('aeiouAEIOU')
  end
end

VOWELS = 'aeiouAEIOU'.split('')

def remove_vowels(arr)
  arr.map do |word|
    word.chars.reject { |char| VOWELS.include?(char) }.join
  end
end

def remove_vowels(arr)
  arr.map do |word|
    word.scan(/[^aeiouAEIOU]/).join
  end
end

def remove_vowels(arr)
  arr.map { |s| s.gsub(/[aeiou]/i, "") }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']