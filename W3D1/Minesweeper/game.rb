require_relative("./board.rb")
require_relative("./tile.rb")
require 'yaml'
require 'remedy'

class Game
    include Remedy

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
        row_index = 0
        column_index = 0
        selected_pos = [row_index, column_index]
        key = nil
        until key == "control_m" 
            @game_board.display_grid
            @game_board.clear_highlights
            user_input = Interaction.new
            key = user_input.get_key.to_s
            if key == "up"
                if row_index == 0 
                    row_index = 8
                else
                    row_index -= 1
                end
                highlight_tile(row_index, column_index)
            elsif key == "down"
                if row_index == 8
                    row_index = 0
                else
                    row_index += 1
                end
                highlight_tile(row_index, column_index)
            elsif key == "right"
                if column_index == 8
                    column_index = 0
                else
                    column_index += 1
                end
                highlight_tile(row_index, column_index)
            elsif key == "left"
                if column_index == 0
                    column_index = 8
                else
                    column_index -= 1
                end
                highlight_tile(row_index, column_index)
            elsif key == "s"
                self.save
                puts "Game saved successfully"
            elsif key == "l"
                self.load
            elsif key == "f"
                puts "enter the position you would like to flag. i.e: '0 4'"
                pos = gets.chomp.split.map(&:to_i)
                tile_to_flag = get_tile_at_pos(pos)
                tile_to_flag.flag
            elsif key == "q"
                raise
            end

        end     
        tile_at_pos = get_tile_at_pos([row_index, column_index])
            if !tile_at_pos.status
                tile_at_pos.recursive_neighbors_reveal
            else
                tile_at_pos.reveal
                @game_board.display_grid
                puts "Game over!"
            end   

    end

    def get_tile_at_pos(pos)
        # pos = string.split.map(&:to_i)
        @game_board[pos]
    end

    def highlight_tile(row_index, column_index)
        highlighted_pos = [row_index, column_index]
        tile_to_be_highlighted = get_tile_at_pos(highlighted_pos)
        tile_to_be_highlighted.highlight
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