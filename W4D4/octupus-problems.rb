fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(array)
    array.find do |ele|
        array.all? do |ele2|
            ele.length >= ele2.length
        end
    end

end

def dominant_octopus(array)
    merge_sort(array).last
end

def clever_octopus(array)
    array.inject do |acc, ele|
        if acc.length >= ele.length
            acc
        else
            ele
        end
    end
end

def merge_sort(array)
    return array if array.length <= 1
    mid_point = array.length/2
    left = merge_sort(array.slice(0...mid_point))
    right = merge_sort(array.slice(mid_point...array.length))
    sorted_array = merge(left, right)
end

def merge(left_side, right_side)
    sorted = []
    until left_side.empty? || right_side.empty?
        if left_side[0].length < right_side[0].length
            sorted.push(left_side.shift)
        else
            sorted.push(right_side.shift)
        end
    end

    sorted + left_side + right_side
end

p clever_octopus(fish)