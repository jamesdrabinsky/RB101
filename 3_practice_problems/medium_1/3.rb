=begin
Alan wrote the following method, which was intended to show all of the factors of the input number:

Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change 
the loop. How can you make this work without using begin/end/until? Note that we're not looking to 
find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of 
raising an exception or going into an infinite loop.
=end

# def factors(number)
#   divisor = number
#   factors = []
#   begin
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end until divisor == 0
#   factors
# ends

def factors(number)
  divisor = number
  factors = []

  while divisor.positive?
    factors << number / divisor if (number % divisor).zero?
    divisor -= 1
  end
  factors
end

# def factors(number)
#   divisor = number
#   factors = []
#   loop do
#     break if divisor.zero?
#     # Allows you to determine if the result of the division is an integer number (no remainder).
#     factors << (number / divisor) if (number % divisor).zero?
#     divisor -= 1
#   end
#   factors # The method will return the list of factors since it is the last executed line
# end

puts factors(100)

