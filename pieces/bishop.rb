require_relative 'piece'

class Bishop < Piece
  def initialize(x, y, color)
    super(x, y, color)
  end
  
  def possible_moves
    moves = []
  end

  def to_s
    super("\u{2657} ", "\u{265D} ")
  end
end