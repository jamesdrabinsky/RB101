=begin
The time of day can be represented as the number of minutes before or after midnight.
If the number of minutes is positive, the time is after midnight.
If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm).
Your method should work with any integer input.

You may not use ruby's Date and Time classes.
=end

=begin
P:
  - Input: integer
  - Output: string

  - Explicit requirements
    - Convert time in minutes-based format to 24 hour format
    - Cannot use ruby's Date and Time classes
    - It should work with any integer input (positive or negative)

  - Implicit requirements
    - ...

D:
  - Input: integer
  - Intermediary: ...
  - Output: string

A:
  - Initialize 'hours' variable and set it to 24
  - Initialize 'minutes' variable and set it to 60
  - Invoke the Integer#divmod method on the interger argument and pass 60 as the divmod argument
  - The first number in the return value will be the hours to add/substract
  - The second number will be the minutes to add/subtract
  - Use string interpolation to format the two numbers in a string
=end

def time_of_day(num)
  minutes = 0
  h, m = num.divmod(60)

  _, h = h.divmod(24) if h.abs > 24

  hours = h.zero? || h.positive? ? 0 : 24
  new_hours = hours + h
  new_minutes = minutes + m

  "#{'%02d' % new_hours}:#{'%02d' % new_minutes}"
  # format('%02d:%02d', hours, minutes)
end


p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

=begin
Further Exploration

it's possible to write a single calculation with % that performs the entire normalization operation in one line of code. 
Give it a try, but don't spend too much time on it.
=end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

p -4231 % MINUTES_PER_DAY


=begin
How would you approach this problem if you were allowed to use ruby's Date and Time classes?
=end

def time_of_day(delta_minutes)
  t = Time.new(1, 1, 1, 24, 0, 0)
  (t + (delta_minutes * 60)).strftime('%H:%M')
end

=begin
How would you approach this problem if you were allowed to use ruby's Date and Time classes and 
wanted to consider the day of week in your calculation? (Assume that delta_minutes is the number 
of minutes before or after midnight between Saturday and Sunday; in such a method, a delta_minutes 
value of -4231 would need to produce a return value of Thursday 01:29.)
=end

def time_of_day(delta_minutes)
  t = Time.new(2022, 10, 22, 24, 0, 0)
  (t + (delta_minutes * 60)).strftime('%Y-%m-%d %I:%M:%S %p')
end

p time_of_day(0)
p time_of_day(-3)
p time_of_day(35)
p time_of_day(-1437)
p time_of_day(3000)
p time_of_day(800)
p time_of_day(-4231)