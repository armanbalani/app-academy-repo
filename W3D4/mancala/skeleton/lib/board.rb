require_relative 'player'


class Board
  attr_accessor :cups

  def initialize(name1, name2)
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
    players = Player.all
    ((start_pos + 1)..(start_pos + stone_count)).each do |i|
      if current_player_name.side == 1
        @cups[i] << :stone unless i == 13
      elsif current_player_name.side == 2
        @cups[i] << :stone unless i == 6
      end
    end


    
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
