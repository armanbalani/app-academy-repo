require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    bucket = bucket(key)
    resize! if @count >= num_buckets
    if bucket.include?(key)
      bucket.update(key, val)
    else
      bucket.append(key, val)
      @count += 1
    end
  end

  def get(key)
    bucket = bucket(key)
    bucket.get(key)
  end

  def delete(key)
    bucket(key).remove(key)
    @count -= 1
  end

  def each(&prc)
    @store.each do |bucket|
      bucket.each do |node|
        prc.call(node.key, node.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    nodes = []
    @store.each do |bucket|
      bucket.each do |node|
        unless node == bucket.head || node == bucket.tail
          nodes << node
          self.delete(node.key)
        end
      end
    end
    num_buckets.times do
      @store << LinkedList.new
    end
    nodes.each do |node|
      self.set(node.key, node.val)
    end
  end

  def bucket(key)
    bucket_index = key.hash % num_buckets  
    @store[bucket_index]  
    # optional but useful; return the bucket corresponding to `key`
  end
end

    hash = HashMap.new
    hash.set(:first, 1)
    hash.set(:second, 2)
    hash.set(:third, 3)
    hash