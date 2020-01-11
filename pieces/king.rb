require_relative 'piece'

class King < Piece
  def initialize(x, y, color)
    super(x, y, color)
  end
  
  def possible_moves
    moves = []
  end

  def to_s
    super("\u{2654} ", "\u{265A} ")
  end
end