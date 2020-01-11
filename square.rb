require 'colorize'

class Square
  attr_accessor :piece
  attr_reader :x, :y, :color

  def initialize(x, y, color)
    @x = x
    @y = y
    @color = color
    @piece = piece
  end
  
  def to_s
    square_color = "on_#{color}"
    "  ".black.send (square_color)
    #piece
  end    
end

#square = Square.new(4, 5, "magenta")
#puts square

#"\u{2657} "