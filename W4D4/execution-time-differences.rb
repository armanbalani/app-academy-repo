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
    
end


list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list)
