class Player
  attr_reader :name, :side

  def initialize(name, side)
    @name = name
    @side = side
  end

  def prompt
    puts "#{@name}, please enter which cup you would like to start from: "
    start_pos = gets.chomp.to_i
    if (start_pos.between?(1,6) && @side != 1 ||
        start_pos.between?(7,12) && @side != 2)
      raise "Not your side!"
    else
      start_pos
    end
  end

  def self.all
    players = []
    ObjectSpace.each_object Player do |player|
      players << player
    end
    players
  end

  def self.find(name)
    players = Player.all
    players.find do |player|
      player.name == name
    end
  end

end

# player1 = Player.new("ye", 1)
# player2 = Player.new("tw", 2)

