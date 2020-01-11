require 'colorize'

class Square
  attr_accessor :piece, :color
  attr_reader :x, :y

  def initialize(x, y, color)
    @x = x
    @y = y
    @color = color
    @piece = nil
  end
  
  def to_s
    square_color = "on_#{color}"
    piece = ""

    self.piece.nil? ? piece = "  " : piece = self.piece
    piece.to_s.black.send (square_color)
  end
end
