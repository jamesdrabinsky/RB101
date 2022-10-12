require 'pry'

def select_nums(arr)
  new_arr = []
  arr.each do |num|
    binding.pry
    new_arr << num if (num.odd?) && ((num <= 15) || (num % 3 == 0))
  end
  new_arr
end

p select_nums([*1..20])
p select_nums([*15..30])
