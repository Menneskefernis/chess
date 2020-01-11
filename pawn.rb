class Pawn
  attr_accessor :x, :y, :first_move
  attr_reader :color

  def initialize(x, y, color)
    @x = x
    @y = y
    @color = color
    @first_move = true
  end
  
  def possible_moves
    moves = []
    moves << [x, y + 1]
    moves << [x, y + 2] if first_move
  end

  def to_s
    color == "white" ? "\u{2659} " : "\u{265F} "
  end
end