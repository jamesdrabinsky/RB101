=begin
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do not use both letters from 
any given block. Each letter in each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, 
false otherwise.
=end

=begin
P:
  Input: String
  Output: Boolean

  Explicit requirements:
    - Given a collection of spelling blocks with two letters per block
    - Return true if you can spell the argument string while not using both letters from 
    any given block
  
  Implicit requirements:
    - The String argument is not case-sensitive

D:
  Input: String
  Output: Boolean
  Intermediate: Nested array with two elements in each sub-array

A:
  - Initialize a constant, `BLOCKS` which is a nested array with each sub-array
  containing the two letters of a block
  - Iterate through the string argument from 0 to the string's length - 1
      - If the letter at the current index position (case-insensitive) exists in the array
      - AND the sub-array in which that letter exists still has both elements in it
        - continue
      - else
        - Explicitly return false
  - Implicitly return true on the last line of the method.

=end

def char_exist?(arr, char)
  arr.each do |sub_arr|
    if sub_arr.include?(char) && sub_arr.size == 2
      sub_arr.pop
      return true
    end
  end
  false
end

def block_word?(string)
  blocks = [
    ['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'], ['G', 'T'], ['R', 'E'],
    ['F', 'S'], ['J', 'W'], ['H', 'U'], ['V', 'I'], ['L', 'Y'], ['Z', 'M']
  ]

  string.upcase!
  (0..string.size - 1).each do |idx|
    return false unless char_exist?(blocks, string[idx])
  end
  true
end

# BLOCKS = %w[BO XK DQ CP NA GT RE FS JW HU VI LY ZM].freeze

# def block_word?(string)
#   up_string = string.upcase
#   # BLOCKS.none? { |block| up_string.count(block) >= 2 }
#   !(BLOCKS.any? { |block| up_string.count(block) >= 2 })
# end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
