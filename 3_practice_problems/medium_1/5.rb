=begin
Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator. 
A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

Ben coded up this implementation but complained that as soon as he ran it, he got an error. 
Something about the limit variable. What's wrong with the code?

How would you fix this so that it works?
=end

# limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 5, 7)
puts "result is #{result}"

=begin
The method cannot access local variables initialized outside of it'ss scope.
This can be fixed by including 'limit' as a parameter in the method definition.
=end
