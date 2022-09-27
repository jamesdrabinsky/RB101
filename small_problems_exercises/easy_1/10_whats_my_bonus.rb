=begin
Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. 
If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.
=end

=begin
P:
  Given a positive integer and boolean
  Return (integer * 0.5) if the boolean is true 
  else return 0

E:
  puts calculate_bonus(2800, true) == 1400
  puts calculate_bonus(1000, false) == 0
  puts calculate_bonus(50000, true) == 25000

D:
  Input: Integer, Boolean
  Output: Integer

A:
  If the bonus parameter is defined as true 
  then return the salary * 0.5
  else return 0

C:
=end

def calculate_bonus(salary, bonus)
  bonus ? (salary / 2) : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000