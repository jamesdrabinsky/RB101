=begin
Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. 
The program must compute the tip and then display both the tip and the total amount of the bill.
=end

puts 'What is the bill?'
bill = gets.chomp.strip.to_f

puts "What's the tip percentage?"
tip = gets.chomp.strip.to_f

tip = bill * (tip / 100)
bill += tip

puts "The tip is $#{format('%0.2f', tip)}"
puts "the total is $#{format('%0.2f', bill)}"
