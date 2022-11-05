=begin
A bubble sort works by making multiple passes (iterations) through the Array. 
On each pass, each pair of consecutive elements is compared. 
If the first of the two elements is greater than the second, then the two elements are swapped. 
This process is repeated until a complete pass is made without performing any swaps; at that point, 
the Array is completely sorted.
=end

=begin
A:
(Nested iteration)
=end

def bubble_sort!(arr)
  (0..arr.size - 1).each do |idx1|
    ((idx1 + 1)..arr.size - 1).each do |idx2|
      if arr[idx1] > arr[idx2]
        arr[idx1], arr[idx2] = arr[idx2], arr[idx1]
      end
    end
  end
  arr
end

# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       next if array[index - 1] <= array[index]
#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end

#     break unless swapped
#   end
# end



array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)