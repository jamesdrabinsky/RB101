=begin
A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two shortest sides must be greater
than the length of the longest side, and all sides must have lengths greater than 0:
if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments,
and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether
the triangle is equilateral, isosceles, scalene, or invalid.
=end

=begin
P:
  Input: 3 integers
  Output: symbol

  Explicit requirements:
     - Given 3 integers (sides of a triangle)
     - Return 
        :equilateral All 3 sides are of equal length
        :isosceles 2 sides are of equal length, while the 3rd is different
        :scalene All 3 sides are of different length
        :invalid if 
         - the sum of the lengths of the two shortest sides is smaller than the length of the longest side, 
         - and all sides are not greater than 0

D:
  Input: 3 integers
  Output: symbol

A:
  - First method: valid?
    - Checks if sum of the lengths of the two shortest sides is longer than length of longest side
    - and that all sides are greater than 0

  - Second method: triangle
  - If valid? returns true:
      - :equilateral All 3 sides are of equal length
      - :isosceles 2 sides are of equal length, while the 3rd is different
      - :scalene All 3 sides are of different length
=end

def valid?(*sides)
  smallest, largest = sides.sort.partition.with_index { |_, i| i < 2 }
  (smallest.sum > largest[0]) && sides.all? { |s| s > 0 }
end

def triangle(*sides)
  if valid?(*sides)
    case sides.uniq.size
    when 1 then :equilateral
    when 2 then :isosceles
    else :scalene
    end
  else
    :invalid
  end
end


p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid