=begin
One day Spot was playing with the Munster family's home computer and he wrote a small program to mess 
with their demographic data:

After writing this method, he typed the following...and before Grandpa could stop him, 
he hit the Enter key with his tail:

mess_with_demographics(munsters)

Did the family's data get ransacked? Why or why not?
=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

puts munsters.object_id
puts munsters['Herman']['age'].object_id

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)
puts munsters.object_id
puts munsters['Herman']['age'].object_id
print(munsters)

=begin
The family's data is modified because index reassignment does mutate the elements
of a collection, in this case the values of a nested hash.
=end
