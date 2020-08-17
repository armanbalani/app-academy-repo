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



end