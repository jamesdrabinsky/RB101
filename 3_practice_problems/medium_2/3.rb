=begin
Let's call a method, and pass both a string and an array as arguments and see how even though they are 
treated in the same way by Ruby, the results can be different.

Study the following code and state what will be displayed...and why:
=end

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # My string looks like this now: pumpkins
puts "My array looks like this now: #{my_array}" # My array looks like this now: ["pumpkins", "rutabaga"]

=begin
The method being called on the string param in the method is reassinging the string to reference a new string object.
The method being call on the array param is mutating the caller and adding an element to the original array.
=end

=begin
In both cases, Ruby passes the arguments "by value", but unlike some other languages, 
the value that gets passed is a reference to some object. The string argument is passed 
to the method as a reference to an object of type String. Similarly, the array is passed 
to the method as a reference to an object of type Array.

The important distinction is that while a reference is passed, the method initializes a new 
local variable for both the string and the array and assigns each reference to the new local 
variables. These are variables that only live within the scope of the method definition.

The String#+= operation is re-assignment and creates a new String object. The reference to this new object 
is assigned to a_string_param. The local variable a_string_param now points to "pumpkinsrutabaga", 
not "pumpkins". It has been re-assigned by the String#+= operation. This means that a_string_param 
and my_string no longer point to the same object.

With the array, one array object can have any number of elements. When we attach an additional element to 
an array using the << operator, Ruby simply keeps using the same object that was passed in, and appends the 
new element to it.

So, because the local variable an_array_param still points to the original object, the local variables my_array and 
an_array_param are still pointing at the same object, and we see the results of what happened to the array "outside" 
of the method.
=end
