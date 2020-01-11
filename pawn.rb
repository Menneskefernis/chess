class Pawn
  attr_accessor :x, :y, first_move
  
  def initialize(x, y)
    @x = x
    @y = y
    @first_move = true
  end
  
  def possible_moves
    moves = []
    moves << [x, y + 1]
    moves << [x, y + 2] if first_move
  end
end