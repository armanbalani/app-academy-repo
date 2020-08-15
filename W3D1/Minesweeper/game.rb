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
        puts "Enter the position you would like to reveal. Or if you'd like to flag a position type the word 'flag'"
        input = gets.chomp
        tile_at_pos = 
        if input == "flag"
            puts "Enter the position you would like to flag"
            flag_input = gets.chomp
            tile_to_flag = get_tile_at_pos(flag_input)
            tile_to_flag.flag
        else 
            tile_at_pos = get_tile_at_pos(input)
            if !tile_at_pos.status
                tile_at_pos.recursive_neighbors_reveal
            else
                tile_at_pos.reveal
                @game_board.display_grid
                puts "Game over!"
            end   
        end    

    end

    def get_tile_at_pos(string)
        pos = string.split.map(&:to_i)
        @game_board[pos]
    end

    def game_over?
        @game_board.grid.any? do |row|
            row.any? { |tile| tile.status && tile.face }
        end
    end




end

game = Game.new
game.play