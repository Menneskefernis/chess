require_relative 'piece'

class Pawn < Piece
  attr_accessor :first_move

  def initialize(x, y, color)
    super(x, y, color)
  
    @first_move = true
  end
  
  def moves
    moves = []
    moves << [x, y + 1]
    moves << [x, y + 2] if first_move
    moves
  end

  def to_s
    super("\u{2659} ", "\u{265F} ")
  end
end