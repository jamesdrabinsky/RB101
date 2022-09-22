=begin
To drive that last one home...let's turn the tables and have the string show a modified output, 
while the array thwarts the method's efforts to modify the caller's version of it.
=end

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"  # pumpkinsrutabaga
puts "My array looks like this now: #{my_array}"  # ['pumpkins']

=begin
When we attach an additional characters to a strning using the << operator, Ruby simply keeps using the same object 
that was passed in, and appends the new characters to it.  Because the local variable a_string_param still points to the 
original object, the local variables my_string and a_string_param are still pointing at the same object, and we see the results of what happened to the array "outside" 
of the method.

The Array#= operation is re-assignment and creates a new Array object. The reference to this new object 
is assigned to an_array_param. The local variable an_array_param now points to ['pumpkins', 'rutabaga'], 
not ['pumpkins']. It has been re-assigned by the Array#= operation. This means that an_array_param 
and my_array no longer point to the same object.
=end