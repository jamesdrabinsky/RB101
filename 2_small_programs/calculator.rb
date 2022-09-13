# Ask the user for two numbers
# Ask the user for operation to perform
# Perform the operaration on the two numbers
# Output the result

Kernel.puts('Welcome to Calculator!')

Kernel.puts("What's the first number?")
number1 = Kernel.gets().chomp()
Kernel.puts("The first number is #{number1}")

Kernel.puts("What's the first number?")
number2 = Kernel.gets().chomp()
Kernel.puts("The second number is #{number2}")

Kernel.puts('What operation would you like to perform on these numbers? 1) add 2) subtract 3) multiply 4) divide')
operator = Kernel.gets().chomp()

if operator == '1'
  result = number1.to_i() + number2.to_i()
elsif operator == '2'
  result = number1.to_i() - number2.to_i()
elsif operator == '3'
  result = number1.to_i() * number2.to_i()
elsif operator == '4'
  result = number1.to_f() / number2.to_f()
end


# puts "\nPlease enter two numbers separated by a space: "
# num1, num2 = gets.chomp.split(' ').map(&:to_i)

# operation = nil
# loop do
#   puts "\nWhat type of operation should be performed? (+ - * /): "
#   operation = gets.chomp
#   break if ['+', '-', '*', '/'].include?(operation)

#   puts 'That operation is not in the list of accepted values!'
#   puts "Please try again\n\n"
# end

# result = num1.send(operation, num2)
# puts "\n#{num1} #{operation} #{num2} = #{result}"