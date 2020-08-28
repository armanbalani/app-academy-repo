fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(array)
    array.find do |ele|
        array.all? do |ele2|
            ele.length >= ele2.length
        end
    end

end

def dominant_octopus(array)
    
    
end