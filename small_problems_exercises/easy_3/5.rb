=begin
Using the multiply method from the "Multiplying Two Numbers" problem,
write a method that computes the square of its argument
(the square is the result of multiplying a number by itself).
=end

def multiply(*nums)
  nums.reduce(:*)
end

def square(num)
  multiply(num, num)
end

def square2(num)
  num**2
end

def power_to_the_n(base, exponent)
  num = 1
  exponent.times { num = multiply(base, num) }
  num
end

p square(5) == 25
p square(-8) == 64

p power_to_the_n(3, 3) == 27
p power_to_the_n(4, 3) == 64
