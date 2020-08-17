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