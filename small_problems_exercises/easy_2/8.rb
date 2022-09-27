=begin
Write a program that asks the user to enter an integer greater than 0, 
then asks if the user wants to determine the sum or product of all numbers 
between 1 and the entered integer.
=end

loop do
  puts 'Please enter an integer greater than 0:'
  number = gets.chomp.to_i

  puts "Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp.downcase.strip

  if ((number.zero? || number.negative?)) || !%w[s p].include?(operation)
    puts "Either the number or operation you entered is invalid.\n\n"
  elsif operation == 's'
    sum_ = (1..number).reduce(&:+)
    puts "The sum of the integers between 1 and #{number} is #{sum_}."
    break
  else
    product_ = (1..number).reduce(&:*)
    puts "The product of the integers between 1 and #{number} is #{product_}."
    break
  end
end

# (1..5).reduce(0) { |total, num| total + num }

