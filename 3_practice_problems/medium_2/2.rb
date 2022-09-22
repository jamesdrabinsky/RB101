=begin
Let's take a look at another example with a small difference in the code:
=end

a = 42
b = 42
c = a

puts a.object_id  #85
puts b.object_id  #85
puts c.object_id  #85 

=begin
integers are immutable; that is, the value of an integer object cannot be mutated. 
In Ruby, each integer is a single immutable object 
As a result, a, b, and c all reference the same immutable integer 42 object. 
Any operation on an integer simply returns a new integer object.

Note that for performance reasons, true, false and nil are also handled specially 
(eg, every instance of true will all have the same object id). 
This also has to do with the immutability of true, false and nil.
=end
