=begin
Create a method that takes two integers as arguments. 
The first argument is a count, and the second is the first number of a sequence that your method will create. 
The method should return an Array that contains the same number of elements as the count argument, 
while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater, 
while the starting number can be any integer value. If the count is 0, an empty list should be returned.
=end

=begin
P:
  Input: two integers
  Output: array

  Explicit requirements:
    - Given two integers as arguments
      - The first argument is a count
      - The second argument is the first number of a sequence that you method will create.
    - Return an array that contains the same number of elements as the count argument, while the values
    of each elemtn will be multiples of the starting number
    - If the count is 0 and empty list should be returned.

A:
  - Initalize a local variable `multiples` to an empty array object
  - Iniitialize a local variable `counter` to the integer value 1.
  - Initiate a loop with a run count equal to the first argument
    - On every loop multiply the second argument by `counter` and append the result to `multiples`
  - Return `multiples`
=end

def sequence(count, start)
  count.times.map do |idx|
    start * (idx + 1)
  end
end

def sequence(count, first)
  (1..count).map { |value| value * first }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []