require_relative("./board.rb")
require_relative("./tile.rb")

class Game

    def initialize
        @game_board = Board.new
        @game_board.populate
    end

    def play_turn
        puts "Enter the position you would like to reveal"
        pos = gets.chomp
        tile_at_pos = grid[pos]
        if !tile_at_pos.bombed?
            neighbors = tile_at_pos.neighbors
        end       

    end




end