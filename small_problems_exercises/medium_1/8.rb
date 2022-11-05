=begin
The Fibonacci series is a sequence of numbers starting with 1 and 1 where each number is the sum of the 
two previous numbers: the 3rd Fibonacci number is 1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, 
and so on. In mathematical terms:
=end

def fibonacci(number)
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end

p fibonacci(6)