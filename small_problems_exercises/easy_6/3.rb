=begin
Write a method that calculates and returns the index of the first Fibonacci number that has the
number of digits specified as an argument. (The first Fibonacci number has index 1.)
=end

=begin
P:
  Input: integer
  Output: integer

  Explicit requirements:
    - Given an integer 
    - Return the index of the first Fibonacci number that has the number of digits specified the integer
    - The first index position of the Fibancci number sequence is 1.

A:
  - 
=end


find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847