=begin
Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. 
For instance, the length of "it's" is 3, not 4.
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
  - On every iteration:
      - Select only alphabetic characters from the current word.
      - Increment the value in `counts` of the key that is equal to the filtered current word's length
=end

def word_sizes(string)
  counts = Hash.new(0)
  string.split.each do |word|
    alpha_chars = word.gsub(/[^A-Za-z]/, '')
    counts[alpha_chars.size] += 1
  end
  counts
end

def word_sizes(string)
  counts = Hash.new(0)
  string.split.each do |word|
    alpha_chars = word.chars.select { |char| char.match?(/[A-Za-z]/) }
    counts[alpha_chars.size] += 1
  end
  counts
end

def word_sizes(string)
  counts = Hash.new(0)
  string.split.each do |word|
    counts[word.count('A-Za-z')] += 1
  end
  counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}