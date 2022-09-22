=begin
How could the following method be simplified without changing its return value?
=end

# def color_valid(color)
#   if color == "blue" || color == "green"
#     true
#   else
#     false
#   end
# end

def color_valid?(color)
  %w[blue green].include?(color)
  # color == "blue" || color == "green"
end

puts color_valid?('red')
puts color_valid?('green')
puts color_valid?('green')
puts color_valid?('')