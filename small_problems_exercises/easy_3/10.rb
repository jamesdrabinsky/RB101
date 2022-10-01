=begin
Write a method that returns true if its integer argument is palindromic, false otherwise. 
A palindromic number reads the same forwards and backwards.
=end

def palindromic_number?(number)
  number.to_s == number.to_s.reverse
end

# p palindromic_number?(34543) == true
# p palindromic_number?(123210) == false
# p palindromic_number?(22) == true
# p palindromic_number?(5) == true

=begin
Suppose your number begins with one or more 0s. Will your method still work? Why or why not? \
Is there any way to address this?
=end

# https://stackoverflow.com/questions/28545559/how-to-work-with-leading-zeros-in-integers

def palindromic_number2?(number)
  formatted_number = format('0%o', number)
  formatted_number == formatted_number.reverse
end

p palindromic_number2?(34543) == true
p palindromic_number2?(123210) == false
p palindromic_number2?(00022) == true
p palindromic_number2?(005) == true