# Ask the user for two numbers
# Ask the user for operation to perform
# Perform the operaration on the two numbers
# Output the result

require 'yaml'
MESSAGES = YAML.load_file('2_small_programs/calculator_messages.yml')

puts MESSAGES.inspect

# def prompt(message)
#   Kernel.puts "=> #{message}"
# end

# def valid_number?(number)
#   !number.to_i.zero?
#   # number.to_i.is_a? Numeric
#   # (number.to_i.is_a? Integer) || (number.to_f.is_a? Float)
# end

# def operation_to_message(op)
#   string_op = case op
#               when '1'
#                 'Adding'
#               when '2'
#                 'Subtracting'
#               when '3'
#                 'Multiplying'
#               when '4'
#                 'Dividing'
#               end
#   string_op
# end

# prompt 'Welcome to Calculator!  Please enter your name:'

# name = ''
# loop do
#   name = gets.chomp

#   if name.empty?
#     prompt "Make sure to use a valid name"
#   else
#     break
#   end
# end

# prompt "Hi #{name}!"

# loop do # main loop
#   number1 = ''
#   loop do
#     prompt "What's the first number?"
#     number1 = gets.chomp

#     if valid_number? number1
#       break
#     else
#       prompt "Hmm .. that doesn't look like a valid number!"
#     end
#   end

#   number2 = ''
#   loop do
#     prompt "What's the second number?"
#     number2 = gets.chomp

#     if valid_number? number2
#       break
#     else
#       prompt "Hmm .. that doesn't look like a valid number!"
#     end
#   end

#   # This delimiter can be anything. Must match closing one.
#   operator_prompt = <<-MSG
#     What operation would you like to perform on these numbers?
#     1) add 
#     2) subtract 
#     3) multiply 
#     4) divide
#   MSG
#   prompt operator_prompt

#   operator = ''
#   loop do
#     operator = gets.chomp
#     if %w(1 2 3 4).include? operator
#       break
#     else
#       prompt "Must choose 1, 2, 3, or 4"
#     end
#   end

#   prompt "#{operation_to_message(operator)} the two numbers..."

#   result = case operator
#            when '1'
#              number1.to_i + number2.to_i
#            when '2'
#              number1.to_i - number2.to_i
#            when '3'
#              number1.to_i * number2.to_i
#            when '4'
#              number1.to_f / number2.to_f
#            end

#   prompt "The result is #{result}"

#   prompt "Do you want to perform another calculation? (Y to calculate again)"
#   answer = gets.chomp
#   break unless answer.downcase.start_with? 'y'
# end

# prompt "Thank you for using the calculator.  Goodbye!"



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
