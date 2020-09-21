class PolyTreeNode
    attr_accessor :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(par)
        return @parent = nil if par.nil?
        if !@parent.nil?
            @parent.children.delete_if { |child| child == self }
        end
        @parent = par
        par.children << self unless par.children.include?(self)
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        child_node.parent = nil
        raise if !self.children.include?(child_node)
    end

    def dfs(target_value)
        return self if self.value == target_value
        self.children.each do |child|
            result = child.dfs(target_value)
            return result unless result.nil?
        end
        nil
    end

    def bfs(target_value)
        queue = [self]
        until queue.empty?
            node = queue.shift
            return node if node.value == target_value
            node.children.each do |child|
                queue << child 
            end
        end
        nil
    end



end