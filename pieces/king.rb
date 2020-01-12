require_relative 'piece'

class King < Piece
  def initialize(x, y, color)
    super(x, y, color)
  end
  
  def moves(board, player)
    moves = []
    options = [[x + 1, y],
               [x - 1, y],
               [x, y + 1],
               [x, y - 1],
               [x + 1, y + 1],
               [x - 1, y + 1],
               [x - 1, y - 1],
               [x + 1, y - 1]
              ]
    options.each { |option| moves << option if option[1] >= 0 }
    moves
  end

  def to_s
    super("\u{2654} ", "\u{265A} ")
  end
end