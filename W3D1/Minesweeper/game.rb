require_relative("./board.rb")
require_relative("./tile.rb")

class Game
    attr_accessor :game_board

    def initialize
        @game_board = Board.new
        @game_board.populate
    end

    def play
        until game_over?
            play_turn
        end
    end

    def play_turn
        @game_board.display_grid
        puts "Enter the position you would like to reveal"
        pos = gets.chomp.split.map(&:to_i)
        tile_at_pos = @game_board[pos]
        if !tile_at_pos.status
            tile_at_pos.recursive_neighbors_reveal
            @game_board.display_grid
        else
            tile_at_pos.reveal
            @game_board.display_grid
            puts "Game over!"
        end       

    end

    def game_over?
        @game_board.grid.any? do |row|
            row.any? { |tile| tile.status && tile.face }
        end
    end




end

game = Game.new
game.play