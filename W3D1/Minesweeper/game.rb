require_relative("./board.rb")
require_relative("./tile.rb")
require 'yaml'

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
        puts "Enter the position you would like to reveal.\nOr\nType 'flag' to flag a position you think might be a bomb.\nType 'save' to save your current session.\nType 'load' to load a previous session"
        @game_board.display_grid
        input = gets.chomp
        if input == "flag"
            puts "Enter the position you would like to flag"
            flag_input = gets.chomp
            tile_to_flag = get_tile_at_pos(flag_input)
            tile_to_flag.flag
        elsif input == "save"
            self.save
            puts "Game saved successfully"
        elsif input == "load"
            self.load
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

    def save
        File.open("save_data.yml", "w") do |f|     
            f.write(@game_board.to_yaml)   
        end
    end

    def load
        if File.exist?("save_data.yml")
            @game_board = YAML.load_file("save_data.yml")
        end
    end

end

game = Game.new
game.play