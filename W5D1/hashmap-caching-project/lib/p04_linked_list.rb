require 'byebug'

class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end


end

class LinkedList
  include Enumerable

  attr_reader :head, :tail

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get_node(key)
    each { |link| return link if link.key == key }
    nil
  end

  def get(key)
    each { |link| return link.val if link.key == key }
    nil
  end

  def include?(key)
    !get_node(key).nil?
  end

  def append(key, val)
    node = Node.new(key, val)
    @tail.prev.next = node
    node.next = @tail
    node.prev = @tail.prev
    @tail.prev = node
    node
  end

  def update(key, val)
    node = get_node(key)
    node.val = val unless node.nil?
  end

  def remove(key)
    node = get_node(key)
    node.prev.next = node.next
    node.next.prev = node.prev
  end

  def each(&prc)
    current_node = @head.next
    until current_node == @tail
      prc.call(current_node)
      current_node = current_node.next
    end
    
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end

