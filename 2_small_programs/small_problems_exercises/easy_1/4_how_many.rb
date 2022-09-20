=begin
Write a method that counts the number of occurrences of each element in a given array.
Once counted, print each element alongside the number of occurrences.
=end

=begin
P:
  Given an array of strings
  print out each unique strign and the count of how many times they occur

  Input: array of strings
  Output: print each element alongside the number of occurrences.s

E:
  count_occurences(vehicles)
    car => 4
    truck => 3
    SUV => 1
    motorcycle => 2

  count_occurences([])
    nil

  count_occurrences([vehicles])
      s["car", "car", "truck", "car", "SUV", "truck", "motorcycle", 
        "motorcycle", "car", "truck"] => 1

D:
  
  Input: array
  interim: dictionary
  Output: none (print statement)

A:
  Initialize a new hash with a default value of 0.
  Iterate through the array and increment the value related to that hash key by 1
  Iterate through the hash and print each key with it's related value with a '=>' 
  separating them

C:
=end


# def count_occurrences(array)
#   occurrences = {}

#   array.uniq.each do |element|
#     occurrences[element] = array.count(element)
#   end

#   occurrences.each do |element, count|
#     puts "#{element} => #{count}"
#   end
# end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(arr)
  arr.tally.each { |i, v| puts "#{i} => #{v}" }
end

# count_occurrences([vehicles])

def count_occurences_2(arr)
  counter = arr.each_with_object(Hash.new(0)) { |i, hash| hash[i] += 1 }
  counter.each { |k, v| puts "#{k} => #{v}" }
end

# count_occurences_2(vehicles)

def count_occurences_3(arr)
  counter = arr.map { |i| arr.count i }.zip(arr).uniq
  counter.each { |k, v| puts "#{k} => #{v}" }
end

# count_occurences_3(vehicles)

def count_occurences_4(arr)
  counter = []
  arr.each do |i|
    counter << (arr.count i)
  end
  item_count = counter.zip(arr).uniq
  item_count.each { |k, v| puts "#{k} => #{v}" }
end

# count_occurences_4(vehicles)

def count_occurences_5(arr)
  counter = (arr.map do |i|
    arr.count(i)
  end).zip(arr).uniq
  counter.each { |k, v| puts "#{k} => #{v}" }
end

# count_occurences_5(vehicles)

=begin
Further Exploration
Try to solve the problem when words are case insensitive, e.g. "suv" == "SUV".
=end

def count_occurrences_explore(array)
  occurrences = {}

  # array.map!(&:downcase)
  array.uniq.each do |element|
    occurrences[element.downcase] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end

count_occurrences_explore(vehicles)
