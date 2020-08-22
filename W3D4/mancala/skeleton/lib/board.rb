require_relative 'player'
require 'byebug'


class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @name2 = name2
    @name1 = name1
    @cups = []
    14.times do 
      cup = []
      @cups << cup
    end

    place_stones(0..5)
    place_stones(7..12)


  end

  def place_stones(range)
    4.times do
      range.each do |i|
        @cups[i] << :stone
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !(0..12).include?(start_pos)
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stone_count = @cups[start_pos].length
    @cups[start_pos].clear
    if start_pos == 12
      next_pos = 0
    else
      next_pos = start_pos + 1
    end
    end_pos = (next_pos + (stone_count - 1))
    (next_pos..end_pos).each do |i|
      if (0..5).include?(start_pos)
        @cups[i % 12] << :stone
      else
        if i == 6
          @cups[7] << :stone
        end
        @cups[i % 14] << :stone
      end
    end
    render
    next_turn(end_pos, start_pos)

  end

  def next_turn(ending_cup_idx, start_pos)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if (0..5).include?(start_pos)
      side = 1
    else
      side = 2
    end

    end_index = ending_cup_idx % 14

    if @cups[end_index].length == 1 && end_index != 13 && end_index != 6
      return :switch
    elsif side == 1 && end_index == 6
      :prompt
    elsif side == 2 && end_index == 13
      :prompt
    else
      end_index
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if (0..5).all? { |i| @cups[i].empty? } || (7..12).all? { |i| @cups[i].empty? }
    return false
  end

  def winner
    return :draw if @cups[13] == @cups[6]
    return @name1 if @cups[6].length > @cups[13].length 
    return @name2
  end
end

# board = Board.new("Erica", "James")
# # board.cups[0].clear
# debugger
# p board.make_move(9, "James")