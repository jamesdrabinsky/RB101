=begin
Write a method which takes a grocery list (array) of fruits with quantities 
and converts it into an array of the correct number of each fruit.
=end

def buy_fruit(arr)
  arr.map { |(fruit, count)| [fruit] * count }.flatten
end

def buy_fruit(arr)
  arr.each_with_object([]) do |(fruit, count), list|
    list.concat([fruit] * count)
  end
end

def buy_fruit(arr)
  arr.each_with_object([]) do |(fruit, count), list|
    count.times { list << fruit }
  end
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]