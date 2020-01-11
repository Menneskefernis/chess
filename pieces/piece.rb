class Piece
  attr_accessor :x, :y
  attr_reader :color
  def initialize(x, y, color)
    @x = x
    @y = y
    @color = color
  end

  def to_s(white_piece, black_piece)
    color == "white" ? white_piece : black_piece
  end
end