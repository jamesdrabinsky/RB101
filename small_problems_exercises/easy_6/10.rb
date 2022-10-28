=begin
Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides 
each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.
=end

def triangle(size)
  (1..size).each do |num|
    space = "%0#{size}s"
    stars = '*' * num
    puts "#{space % stars}"
  end
end

def reverse_triangle(size)
  size.downto(1).each do |num|
    space = "%0#{size}s"
    stars = '*' * num
    puts "#{space % stars}"
  end
end

reverse_triangle(15)
