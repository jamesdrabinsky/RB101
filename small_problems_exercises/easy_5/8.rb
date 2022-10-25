=begin
Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on
the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen,
sixteen, seventeen, eighteen, nineteen
=end

=begin
p: 
  Input: array
  Output: array

  Explicit requirements
    - Given an array of integers between 0 and 19
      return an array of those integers sorted based on the English words for each number

  Implicit requirements
    - Should the method return the original array or a copy of the array?

D:
  Input: array
  Output: array
  Intermediate: hash (pairing numbers with their corresponding words)

A:
  - Initialize a variable `alpha_nums` which contains key-value pairs of integers 0 through 19 and their
  corresponding english words
  - Invoke the `sort_by` method on an array of integers and in the block use hash key reference to
    return the corresponding value in `alpha_nums`
=end

INTEGER_WORDS = %w(zero one two three four five six seven eight nine ten eleven 
                   twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(arr)
  alpha_nums = arr.zip(INTEGER_WORDS).to_h
  arr.sort_by { |num| alpha_nums[num] }
end

def alphabetic_number_sort(arr)
  arr.sort_by { |num| INTEGER_WORDS[num]}
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

=begin
Further Exploration
Why do you think we didn't use Array#sort_by! instead of Enumerable#sort_by?

For an extra challenge, rewrite your method to use Enumerable#sort (unless you already did so).
=end

# We didn't use Array#sort_by! because we don't want to mutate the original array
# We only want to return a copy of the array sorted acccording to a certain criteria.

def alphabetic_number_sort(arr)
  alpha_nums = arr.zip(INTEGER_WORDS).to_h
  arr.sort { |a, b| alpha_nums[a] <=> alpha_nums[b] }
end