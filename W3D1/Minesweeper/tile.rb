class Tile

    attr_accessor :status, :value, :face, :proximity, :flagged

    def initialize(board)
        @status = false
        @face = false
        @board = board
        @proximity = 0
        @flagged = false
    end

    def reveal
        @face = true
    end

    def flag
        @flagged = true
    end

    def recursive_neighbors_reveal
        self.face = true
        return if self.proximity > 0
        neighboring_tiles = self.get_neighbors
        neighboring_tiles.each do |tile|
            tile.recursive_neighbors_reveal unless tile.face
            tile.face = true
        end
    end

    def update_proximity
        neighbors = self.get_neighbors
        count = neighbors.count { |tile| tile.status }
        self.proximity += count
    end


    def get_neighbors
        grid = @board.grid
        neighbor_tiles = []
        pos = self.get_pos
        row_index = pos[0]
        item_index = pos[1]
        ((row_index - 1)..(row_index + 1)).each do |i|
            ((item_index - 1)..(item_index + 1)).each do |x|
                unless i > 8 || x > 8 || i < 0 || x < 0
                    neighbor = grid[i][x]
                    neighbor_tiles << neighbor unless neighbor.face
                end
            end
        end
        neighbor_tiles
    end

    def inspect
        "#{self.object_id} face: #{self.face} status: #{self.status} prox: #{self.proximity}"
    end
        
        # neighbor_tiles << @board.grid[row_index, item_index - 1]
        # neighbor_tiles << @board.grid[row_index, item_index + 1]
        # neighbor_tiles << @board.grid[row_index - 1, item_index]
        # neighbor_tiles << @board.grid[row_index - 1, item_index - 1]
        # neighbor_tiles << @board.grid[row_index - 1, item_index + 1]



    def get_pos
        pos = []
        @board.grid.each.with_index do |row, idx|
            tile_index = row.index(self)
            if !tile_index.nil?
                pos << idx
                pos << tile_index
            end
        end
        pos
    end



end

#tile at current row (tile_index - 1) and tile at current row at (tile_index + 1)
#also want the tiles at row index + 1 and row index - 1