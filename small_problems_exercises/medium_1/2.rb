=begin
Write a method that can rotate the last n digits of a number. For example:
=end

# rubocop: disable Style/ParallelAssignment
def rotate_rightmost_digits(int, n)
  string = int.to_s
  first, second = string[0...-n], string[-n..]
  second_rotated = second[1..] + second[0]
  (first + second_rotated).to_i
end

def rotate_rightmost_digits(int, n)
  string = int.to_s
  stop = string.size - n
  first, second = string.chars.partition.with_index { |_, i| i == stop }
  (second + first).join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

