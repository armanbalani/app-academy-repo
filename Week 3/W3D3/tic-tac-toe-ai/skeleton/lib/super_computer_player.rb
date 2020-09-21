require_relative 'tic_tac_toe_node'
require 'byebug'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)

    node.children.each do |child|
      if child.winning_node?(mark)
        return child.prev_move_pos
      end
    end

    node.children.each do |child|
      if !child.losing_node?(mark)
        return child.prev_move_pos
      end
    end

    raise
  end

end

# game = TicTacToe.new("b", "c")
# game.board[[0, 0]] = :x
# game.board[[2, 0]] = :x
# game.board[[1, 0]] = :o
# game.board[[2, 1]] = :o
# # game.board.rows.each do |row|
# #   p row
# # end

# super_computer = SuperComputerPlayer.new
# # debugger
# p super_computer.move(game, :x)



if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
