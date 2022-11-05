=begin
Write a method that returns the number of Friday the 13ths in the year given by an argument.
You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) 
and that it will remain in use for the foreseeable future.
=end

require 'Date'

def friday_13th(year)
  first = Date.new(year, 1, 1)
  last = Date.new((year + 1), 1, 1)

  (first...last).reduce(0) do |total, date|
    (date.day == 13) && (date.friday?) ? total += 1 : total += 0
  end
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2