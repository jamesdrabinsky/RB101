=begin
Write a method that takes a string with one or more space separated words and returns a hash that shows 
the number of words of different sizes.

Words consist of any string of characters that do not include a space.
=end

=begin
P:
  Input: string
  Output: Hash (word lengths as keys and count as values)

  Explicit Requirements:
    - Given a string with one or more space separated words return a hash 
      that shows the number of words of different sizes
    - Words are any string of characters that does not include a space

D: 
  Input: string
  Output: Hash (word lengths as keys and count as values)
  Intermediate: Hash with default value of 0

A: 
  - Initialize a hash `counts` that has a default value of zero
  - Convert the string argument into a array
  - Iterate through the array
  - On every iteration, get the length of the current element.
  - Increment the value in `counts` of the key that is equal to the current elements length
=end

def word_sizes(string)
  counts = Hash.new(0)
  string.split.each do |word|
    counts[word.size] += 1
  end
  counts.sort_by { |k, _| k }.to_h
end

def word_sizes(string)
  counts = string.split.each_with_object(Hash.new(0)) do |word, hsh|
    hsh[word.size] += 1
  end
  counts.sort_by { |k, _| k }.to_h
end

def word_sizes(string)
  counts = {}
  string.split.each do |word|
    counts[word.size] = counts.fetch(word.size, 0) + 1
  end
  counts.sort_by { |k, _| k }.to_h
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
