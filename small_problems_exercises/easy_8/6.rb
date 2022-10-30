=begin
Write a method that takes two arguments: the first is the starting number, and the second is the ending number. 
Print out all numbers from the starting number to the ending number, except 
  - if a number is divisible by 3, print "Fizz", 
  - if a number is divisible by 5, print "Buzz", 
  - and finally if a number is divisible by 3 and 5, print "FizzBuzz".
=end

def fizzbuzz(start_, end_)
  res = (start_..end_).map do |num|
    if num % 5 == 0 && num % 3 == 0
      'FizzBuzz'
    elsif num % 5 == 0
      'Buzz'
    elsif num % 3 == 0 
      'Fizz'
    else
      num
    end
  end
  res.join(' ')
end

puts fizzbuzz(1, 15)