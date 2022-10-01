=begin
Write a program that prompts the user for two positive integers, and then prints the results of the following 
operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about 
validating the input.
=end

def integer?(num)
  num.to_i.to_s == num
end

number1 = ''
number2 = ''
loop do
  puts 'Enter the first number:'
  number1 = gets.chomp.strip
  puts 'Enter the second number:'
  number2 = gets.chomp.strip

  if [number1, number2].any? { |num| !integer?(num) }
    puts "That is not a valid integer.  Please try again\n\n"
  elsif number2.to_i.zero?
    puts "Second number cannot be zero.  Please try again\n\n"
  else
    break
  end
end

[:+, :-, :*, :/, :%, :**].each do |operation|
  num1, num2 = [number1, number2].map(&:to_i)
  result = [num1, num2].reduce(&operation)
  puts "#{num1} #{operation} #{num2} = #{result}"
end
