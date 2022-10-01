=begin
In this exercise, you will write a function named xor that takes two arguments, and returns true if exactly 
one of its arguments is truthy, false otherwise. Note that we are looking for a boolean result instead of a 
truthy/falsy value as returned by || and &&.
=end

# def xor?(value1, value2)
#   !!((value1 && !value2) || (value2 && !value1))
# end

# def xor?(bool1, bool2)
#   !(bool1 == bool2)
#  end

def xor?(*args)
  args.count(true) == 1
  # args.count(&:itself) == 1
end

def xor2?(*args)
  args.one?
end

def xor3?(*args)
  args.count { |arg| arg } == 1
end

def xor4?(*args)
  args.each_with_object([]) { |arg, arr| arr << arg if arg }.size == 1
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false