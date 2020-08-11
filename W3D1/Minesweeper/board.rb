require_relative("./tile.rb")

class Board

    attr_reader :grid

    def initialize
        @grid = []
    end

    def populate
        until @grid.length == 81
            @grid << Tile.new(self)
        end

        until @grid.count { |tile| tile.status == true } == 10
            index = rand(0..80)
            tile = @grid[index]
            tile.status = true
        end

        @grid = @grid.each_slice(9).to_a.transpose
    end

    def display_grid
        print "  "
        (0..@grid.length - 1).to_a.each { |num| print num.to_s + " " }
        puts
        @grid.each.with_index do |sub, idx|
            print "#{idx} " 
            sub.each do |tile|
                if tile.face && !tile.status
                    print "N"
                elsif tile.face && tile.status
                    print "B"
                end
            end
            puts
        end
    end

end

board = Board.new
board.populate
p board.grid[5][0].get_pos
