=begin
Write a method that displays a 4-pointed diamond in an n x n grid, 
where n is an odd integer that is supplied as an argument to the method. 
You may assume that the argument will always be an odd integer.
=end

=begin

diamond(1)

*


diamond(3)

 *
***
 *


diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *
=end

# def diamond(num)
#   if num == 1
#     puts('*')
#   elsif num == 3
#     puts(' * ')
#     puts('***')
#     puts(' * ')
#   else
#     config = [*(1..num).step(2)]
#     config += config[..-2].reverse

#     config.each do |stars|
#       space = ' ' * ((num - stars) / 2)
#       puts(space + ('*' * stars) + space)
#     end
#     # config.each { |stars| puts ('*' * stars).center(num) }
#   end
# end

# def diamond(num)
#   config = [*(1..num).step(2)]
#   config += config[..-2].reverse

#   if config.size == 2
#     puts '*'
#   else
#     config.each do |stars|
#       space = ' ' * ((num - stars) / 2)
#       puts(space + ('*' * stars) + space)
#     end
#   end
# end

def diamond(num)
  config = [*(1..num).step(2)]
  config += config[..-2].reverse

  config.each do |stars|
    puts ('*' * stars).center(num)
  end
end

diamond(11)

=begin
Further Exploration
Try modifying your solution or our solution so it prints only the outline of the diamond:
=end

def hollow_diamond(num)
  config = [*(1..num).step(2)]
  config += config[..-2].reverse

  config.each do |star_count|
    if star_count > 1
      stars = '*' + (' ' * (star_count - 2)) + '*'
      puts(stars.center(num))
    else
      puts ('*' * star_count).center(num)
    end
  end
end