=begin
Write a method that returns a list of all substrings of a string that start at the beginning 
of the original string. The return value should be arranged in order from shortest to longest substring.
=end

=begin
P:
  Input: string
  Output: array

  Explicit requirements:
    - Given a string
    - Return a list of a all substrings of the string that start 
    at the beginning of the original string
    - The return value should be aranged from shortest to longest substring

  A:
    - Initialize a local variable `substrings` to an empty array object
     - Iterate through the a range from 0 to the string length - 1
        - On each iteration, take a slice of the string from the index position 0 to the number 
      in the range on the current iteration.
        - Add that slice to `substrings`
    - Return `substrings` when iteration is complete
=end

def leading_substrings(string)
  (0..string.size - 1).map do |idx|
    string[0..idx]
  end
end

def leading_substrings(string)
  (1..string.size).map do |idx|
    string.slice(0, idx)
  end
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']