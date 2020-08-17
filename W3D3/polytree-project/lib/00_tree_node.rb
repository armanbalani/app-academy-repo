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


end