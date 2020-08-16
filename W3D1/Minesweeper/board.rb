require_relative("./tile.rb")
require 'byebug'
require 'colorize'
require 'remedy'

class Board

    attr_reader :grid

    def initialize
        @grid = []
    end

    def populate
        until @grid.length == 81
            @grid << Tile.new(self)
        end

        until @grid.count { |tile| tile.status == true } == 9
            index = rand(0..80)
            tile = @grid[index]
            tile.status = true
        end

        @grid = @grid.each_slice(9).to_a.transpose

        @grid.each do |row|
            row.each do |tile|
                tile.update_proximity
            end
        end
    end

    def clear_highlights
        @grid.each do |row|
            row.each do |tile|
                tile.highlighted = false
            end
        end
    end

    def find_highlight
        @grid.find do |row|
            return row.find { |tile| tile.highlighted}
        end
    end

    def[](pos)
        row, col = pos
        @grid[row][col]
    end

    def display_grid
        print "  "
        (0..@grid.length - 1).to_a.each { |num| print num.to_s + " " }
        puts
        @grid.each.with_index do |sub, idx|
            print "#{idx} " 
            sub.each do |tile|
                if tile.highlighted
                    print "X ".colorize(:blue)
                elsif !tile.status && tile.face
                    if tile.proximity == 0
                        print "#{tile.proximity} ".colorize(:light_green)
                    elsif tile.proximity == 1
                        print "#{tile.proximity} ".colorize(:yellow)
                    else
                        print "#{tile.proximity} ".colorize(:light_red)
                    end   
                elsif tile.status && tile.face
                    print "B ".colorize(:red)
                elsif tile.flagged
                    print "F ".colorize(:cyan)
                else
                    print "  "
                end
            end
            puts
        end
    end

end
# board = Board.new
# board.populate
# board[[0,0]].highlight
# p board.find_highlight

# include Remedy
# user_input = Interaction.new
# key = user_input.get_key
# # puts key.to_s



# board = Board.new
# board.populate
# board.grid

# # board.display_grid
# board.grid.each do |row| 
#     row.each do |tile|
#         tile.update_proximity
#     end
# end
# board.display_grid
# # debugger
# p board[[2, 2]]
# # board.grid.each do |row|
# #     p row
# # end
# # board.display_grid



# p board.grid
# # board.grid.each do |row|
# #     row.map! do |tile|
# #         tile.inspect
# #     end
# #     p row
# # end
# # board.grid
