=begin
Print all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.
=end

(1..99).each { |i| puts i if i.even? }

puts (1..99).select(&:even?)

1.upto(99) { |i| puts i if i.even? }

puts *(2..98).step(2)