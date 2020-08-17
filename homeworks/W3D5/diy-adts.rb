class Stack
    def initialize
      @elements = []
    end

    def push(el)
      @elements << el
    end

    def pop
        @elements.pop
      # removes one element from the stack
    end

    def peek
        @elements.last
      # returns, but doesn't remove, the top element in the stack
    end
end

class Queue
    def initialize
        @elements = []
    end

    def enqueue(el)
        @elements << el
    end

    def dequeue
        @elements.shift
    end

    def peek
        @elements.first
    end
end

class Map

    def initialize
        @pairs = []
    end

    def set(key, value)
        keys = @pairs.map { |pair| pair[0] }
        if keys.include?(key)
            index = @pairs.index { |pair| pair[0] == key }
            @pairs[index] = [key, value]
        else
            @pairs << [key, value]
        end
    end

    def get(key)
        @pairs.select { |pair| pair[0] == key }
    end

    def delete(key)
        @pairs.delete_if { |pair| pair[0] == key }
    end

    def show
        @pairs.each { |pair| p pair }
    end


end
