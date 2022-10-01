=begin
Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. 
The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the 
argument Array.
=end

def oddities(arr)
  arr.each_slice(2).map(&:first)
end

def oddities2(arr)
  arr.select.with_index { |_, idx| idx.even? }
end

def oddities3(arr)
  steps = (0..arr.size - 1).step(2)
  arr.values_at(*steps)
end

# p oddities3([2, 3, 4, 5, 6]) == [2, 4, 6]
# p oddities3([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# p oddities3(['abc', 'def']) == ['abc']
# p oddities3([123]) == [123]
# p oddities3([]) == []

=begin
Write a companion method that returns the 2nd, 4th, 6th, and so on elements of an array.
=end

def evens(arr)
  arr.each_slice(2).select { |pair| pair.size == 2 }.map(&:last)
end

def evens2(arr)
  arr.each_slice(2).map { |pair| pair.last if pair.size == 2 }.compact
end

def evens3(arr)
  arr.select.with_index { |_, idx| idx.odd? }
end

def evens4(arr)
  steps = (1..arr.size - 1).step(2)
  arr.values_at(*steps)
end

p evens4([2, 3, 4, 5, 6]) == [3, 5]
p evens4([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p evens4(['abc', 'def']) == ['def']
p evens4([123]) == []
p evens4([]) == []