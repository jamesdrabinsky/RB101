=begin
Build a program that displays when the user will retire and how many years she has to work till retirement.
=end

require 'Date'

puts 'What is your age?'
age = gets.chomp.strip.to_i

puts 'At what age would you like to retire?'
retirement_age = gets.chomp.strip.to_i

year = Date.today.year
years_left = retirement_age - age
puts "It's #{year}.  You will retire in #{year + years_left}"
puts "You only have #{years_left} years to go!"
