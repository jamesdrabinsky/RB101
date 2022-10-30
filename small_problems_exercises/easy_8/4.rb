=begin
Write a method that returns a list of all substrings of a string. 
The returned list should be ordered by where in the string the substring begins. 
This means that all substrings that start at position 0 should come first, 
then all substrings that start at position 1, and so on. Since multiple substrings 
will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

You may (and should) use the leading_substrings method you wrote in the previous exercise:
=end

# def leading_substrings(string)
#   (0..string.size - 1).map do |idx|
#     string[0..idx]
#   end
# end

# def substrings(string)
#   results = []
#   (0...string.size).each do |start_index|
#     this_substring = string[start_index..-1]
#     results.concat(leading_substrings(this_substring))
#   end
#   results
# end

def substrings(string)
  (0..string.size - 1).each_with_object([]) do |idx1, substrings|
    (idx1..string.size - 1).each do |idx2|
      substrings << string[idx1..idx2]
    end
  end
end

def substrings(string)
  ((0..string.size - 1).map do |idx1|
    (idx1..string.size - 1).map do |idx2|
      string[idx1..idx2]
    end
  end).flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]