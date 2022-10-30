=begin
Write a method that determines the mean (average) of the three scores passed to it, 
and returns the letter value associated with that grade.
=end

def get_grade(*grades)
  avg = grades.sum / grades.size
  case avg
  when 90..100 then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  else 'F'
  end
end

def get_grade(*grades)
  avg = grades.sum / grades.size
  letter_ranges = {
    90..100 => 'A',
    80...90 => 'B',
    70...80 => 'C',
    60...70 => 'D',
    0..60 => 'F'
  }
  letter_ranges.find { |k, _| k.include?(avg) }[1]
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

=begin
Further exploration
How would you handle this if there was a possibility of extra credit grades causing it to exceed 100 points?
=end

def get_grade(*grades)
  avg = grades.sum / grades.size
  case avg
  when 90.. then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  else 'F'
  end
end