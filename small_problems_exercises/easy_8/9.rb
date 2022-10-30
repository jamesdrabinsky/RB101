=begin
Write a method that takes a positive integer as an argument and 
returns that number with its digits reversed. Examples:
=end

def reversed_number(num)
  num.to_s.reverse.to_i
end

def reversed_number(num)
  numbers = []
  new_number = num

  until new_number == 0
    new_number, res = new_number.divmod(10)
    numbers << res
  end
  numbers.join.to_i
end

def reversed_number(num)
  num.digits.join.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1