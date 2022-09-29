=begin
Write a program that solicits 6 numbers from the user, 
then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.
=end

=begin
P:
  Input: array of string
  Ouput: Boolean

  Explicit requirements:
  - Every number must be solicited from the user
  - The 6th number must be the same as one of the first 5 numbers to output a true value

  Inplicit requirement:
  - The user must provide an integer value
  - The user cannot enter an empty value

E:
  ...

D:
  Input: arrray of strings
  Output: Boolean

A:
  Store the first five values entered by the user in an array
  Search the array to find the sixth number.  Return a boolean value which indicates
  whether or not the sixth number is in the array.

C:
=end

def find_number(arr, num)
  if arr.include?(num)
    'The sixth number does appear amongst the first five numbers!'
  else
    'The sixth number does not appear amongst the first five numbers!'
  end
end

def integer?(num)
  num.to_i.to_s == num
end

numbers = []
number = ''

6.times do |idx|
  loop do
    puts "Please enter number #{idx + 1}:"
    number = gets.chomp.strip
    break if integer?(number)

    puts "That is not a valid integer.  Please try again\n\n"
  end
  numbers << number
end

first_five = numbers[..-2]
sixth = numbers[-1]
puts find_number(first_five, sixth)
