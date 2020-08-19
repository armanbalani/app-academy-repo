require_relative 'tic_tac_toe'
require 'byebug'

class TicTacToeNode
  
  attr_accessor :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return true if @board.over? && evaluator != @board.winner
    return false if @board.over? && (evaluator == @board.winner || board.winner.nil?)
    if @next_mover_mark == :x
      self.children.none? { |node| node.losing_node?(evaluator) }
    end

    if @next_mover_mark == :o
      self.children.any? { |node| node.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.

  def children
    nodes = []
    (0...@board.rows.length).each do |r|
      (0...@board.rows[r].length).each do |p|
        if @board.rows[r][p].nil?
          node_mark = :x if @next_mover_mark == :o
          node_mark = :o if @next_mover_mark == :x
          new_node = TicTacToeNode.new(@board.dup, node_mark, [r,p])
          new_node.board[[r,p]] = next_mover_mark
          nodes << new_node
          @prev_move_pos = [r,p]
        end
      end
    end
    nodes
  end


end

  hp = HumanPlayer.new("Ned")
  cp = ComputerPlayer.new
  game = TicTacToe.new(hp, cp)
  p game.board.rows



  node = TicTacToeNode.new(game.board, "Y")
  p node.children
