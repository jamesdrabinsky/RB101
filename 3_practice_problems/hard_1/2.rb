=begin
What is the result of the last line in the code below?
=end

greetings = { a: 'hi' }
puts greetings.object_id
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings # :a
puts greetings.object_id

=begin
puts greeting with return {:a=>"hi there"}.  The greetings hash is never mutated in this code.
An element within greetings is assigned to the variable informal_greeting (they point to the same memory address)
and that variable is mutated, which in turn mutates the element within greetings.
=end

=begin
The output is {:a=>"hi there"}. The reason is because informal_greeting is a reference to the original object. 
The line informal_greeting << ' there' was using the String#<< method, which modifies the object that called it. 
This means that the original object was changed, thereby impacting the value in greetings. If instead of modifying 
the original object, we wanted to only modify informal_greeting but not greetings, there are a couple of options:

we could initialize informal_greeting with a reference to a new object containing the same value by 
informal_greeting = greetings[:a].clone. 
we can use string concatenation, informal_greeting = informal_greeting + ' there', which returns a new 
String object instead of modifying the original object.
=end