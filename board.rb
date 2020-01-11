require_relative 'square'

class Board
  attr_accessor :state
  
  def initialize
    @state = create_board
  end

  def create_board
    Array.new(8) { |x| Array.new(8) do |y|
      color = set_square_color(x, y)
      Square.new(x, y, color)
    end
    }
  end

  def set_square_color(x, y)
    color = ""
    if x % 2 == 0
      y % 2 == 0 ? color = "white" : color = "magenta"
    else
      y % 2 == 0 ? color = "magenta" : color = "white"
    end
    color
  end
end

board = Board.new
puts board.state