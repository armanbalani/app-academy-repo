    # list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
    # my_min(list)  # =>  -5

    # list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

    def my_min(array)
        array.find do |ele|
            array.all? do |ele1|
                ele <= ele1
            end
        end
    end

    #  time complexity = O(n^2)

    def better_my_min(array)
        array.inject do |acc, ele|
            if acc <= ele
                acc
            else
                ele
            end
        end
    end

    #  time complexity = O(n)


#  list = [2, 3, -6, 7, -6, 7]
#     largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

def largest_contiguous_subsum(array)
    sub_arrays = []
    (0...array.length).each do |i|
        (0...array.length).each do |x|
            sub_arrays << array[i..x] unless array[i..x].empty?
        end
    end
    p sub_arrays.length
    max_array = sub_arrays.max_by { |sub| sub.sum }
    max_array.sum

end

# time complexity = O(n^2 + x)

list = [2, 3, -6, 7, -6, 7, 3, 4, 5, 10, 7]

def better_largest_contiguous_subsum(array)
    largest_sum = 0
    (0...array.length).each do |i|
        x = i
        until x == array.length
    end
end


