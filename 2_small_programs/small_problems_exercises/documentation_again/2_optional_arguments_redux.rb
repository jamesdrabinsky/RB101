=begin
Assume you have the following code:

What will each of the 4 puts statements print?
=end

require 'date'

puts Date.civil # A Date object with the date -4712-01-01
puts Date.civil(2016) # A Date object with the date 2016-01-01
puts Date.civil(2016, 5) # A Date object with the date 2016-05-01
puts Date.civil(2016, 5, 13) # A Date object with the date 2016-05-13

=begin
The documentation for Date::civil (note that it is a class method) shows that its
signature is:

civil([year=-4712[, month=1[, mday=1[, start=Date::ITALY]]]]) → date

This signature uses [] to show that all of the arguments are optional. 
This is only a documentation convention; the brackets should not be included in y
our program.
=end