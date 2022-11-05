=begin
In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.
=end

def fibonacci(nth)
  first, last = [1, 1]
  (3..nth).each do 
    first, last = [last, first + last]
  end
  last
end

def fibonacci_last(number)
  fibonacci(number).digits[0]
end

p fibonacci_last(20)