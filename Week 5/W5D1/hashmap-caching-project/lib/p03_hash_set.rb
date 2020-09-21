class HashSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count >= num_buckets
      resize!
    end
    unless self.include?(key)
      self[key.hash] << key 
      @count += 1
    end
  end

  def remove(key)
    if self.include?(key)
      self[key.hash].delete(key)
      @count -= 1
    end
  end

  def include?(key)
    self[key.hash % num_buckets].include?(key)
    
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    num_buckets.times do
      @store << Array.new
    end
    @store.each do |bucket|
      bucket.each do |num|
        bucket.delete(num)
        self.insert(num)
        @count -= 1
      end
    end
  end
end
