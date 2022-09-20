=begin
Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, 
always starting with 1. The length of the string should match the given integer.
=end

=begin
P:
  Given a positive integer
  Return a string of alternating 1's and 0's equal to the lenght of the integer

  Input: integer
  Output: string

E:
  puts stringy(6) == '101010'
  puts stringy(9) == '101010101'
  puts stringy(4) == '1010'
  puts stringy(7) == '1010101'

D:
  ...

A:
  Initialize a new string as '1'
  Initialize a count variable as 1
  While count < the interger argument
    add '0' to the new string if the string[count - 1] index = '1'
    else add '1 
    increment the count variable by 1
  return the new string

C:
=end

def stringy(size)
  string = ''

  size.times do |index|
    number = index.even? ? 1 : 0
    string << number.to_s
  end
  string
end

def stringy_2(size)
  string = ''
  size.times { |idx| idx.even? ? string << '1' : string << '0' }
  string
end

def stringy_5
  (1..9).map{ |num| num.odd? ? '1' : '0' }.join
end

def stringy_3(number)
  string = '1'
  count = 1
  while count < number
    if string[count - 1] == '1'
      string << '0'
    else
      string << '1'
    end
    count += 1
  end
  string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

=begin
Further Exploration
Modify stringy so it takes an additional optional argument that defaults to 1. 
If the method is called with this argument set to 0, the method should return a 
String of alternating 0s and 1s, but starting with 0 instead of 1.
=end

def stringy_4(size, start = 1)
  string = ''

  size.times do |index|
    if start == 1
      number = index.even? ? 1 : 0
    else
      number = index.odd? ? 1 : 0
    end
    string << number.to_s
  end
  string
end