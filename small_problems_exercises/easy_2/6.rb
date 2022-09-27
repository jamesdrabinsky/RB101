=begin
Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.
=end

(0..99).each { |i| puts i if i.odd? }

puts (0..99).select(&:odd?)

1.upto(99) { |i| puts i if i.odd? }

puts *(1..99).step(2)
