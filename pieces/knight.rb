require_relative 'piece'

class Knight < Piece
  def initialize(x, y, color)
    super(x, y, color)
  end
  
  def possible_moves
    moves = []
  end

  def to_s
    super("\u{2658} ", "\u{265E} ")
  end
end