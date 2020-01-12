require_relative 'piece'

class Queen < Piece
  def initialize(x, y, color)
    super(x, y, color)
  end
  
  def moves(board, player)
    moves = []
    moves += diagonal_up(board, self)
    moves += diagonal_down(board, self)
  end

  def to_s
    super("\u{2655} ", "\u{265B} ")
  end
end