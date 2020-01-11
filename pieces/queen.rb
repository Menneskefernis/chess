require_relative 'piece'

class Queen < Piece
  def initialize(x, y, color)
    super(x, y, color)
  end
  
  def possible_moves
    moves = []
  end

  def to_s
    super("\u{2655} ", "\u{265B} ")
  end
end