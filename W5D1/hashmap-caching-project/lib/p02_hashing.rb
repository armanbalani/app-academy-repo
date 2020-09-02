class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    initial = self.length
    (0...self.length).each do |i|
      initial += (self[i] + i.hash)/self[i]
    end
    initial
  end
end

class String
  def hash
    alhapbet = ("a".."z").to_a
    initial = 0
    self.each_char do |char|
      index = alhapbet.find_index(char)
      initial += index.hash/(self.length + index.to_i)
      initial /= index.to_i + 1
    end
    initial 
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    initial = 0
    self.each do |k, v|
      initial += (k.hash + v.hash)
    end
    initial
  end
  
end
