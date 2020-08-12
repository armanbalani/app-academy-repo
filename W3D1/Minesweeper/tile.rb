class Tile

    attr_accessor :status, :value, :face

    def initialize(board)
        @status = false
        @face = false
        @board = board
    end

    def reveal
        if !@status
            @face = true
            #reveal_neighboring tiles
        else
            #game_over
        end

    end

    def recursive_neighbors_reveal(neighboring_tiles)
        return if neighboring_tiles.any? { |tile| tile.status }
        neighboring_tiles.each do |tile|
            tile.face = true
            recursive_neighbors_reveal(tile.neighbors)
        end
    end


    def neighbors
        grid = @board.grid
        neighbor_tiles = []
        pos = self.get_pos
        row_index = pos[0]
        item_index = pos[1]
        ((row_index - 1)..(row_index + 1)).each do |i|
            ((item_index - 1)..(item_index + 1)).each do |x|
                neighbor_tiles << grid[i][x]
            end
        end
        neighbor_tiles
    end

    def inspect
        "#{self.object_id} face: #{self.face} status: #{self.status}"
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