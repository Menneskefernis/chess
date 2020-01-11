require_relative 'square'

class Board
  attr_accessor :state
  
  def initialize
    @state = create_board(8, 8)
  end

  def create_board(height, width)
    Array.new(width) { |x| Array.new(height) do |y|
      color = set_square_color(x, y)
      Square.new(x, y, color)
    end
    }
  end

  def set_square_color(x, y)
    color = ""
    if x % 2 == 0
      y % 2 == 0 ? color = "magenta" : color = "white"
    else
      y % 2 == 0 ? color = "white" : color = "magenta"
    end
    color
  end

  def draw
    (state[0].size - 1).downto(0) do |i|
      state.each do |row|
        #row[i].piece = "\u{2657} " if row[i].x == 1 && row[i].y == 0
        print row[i]
      end
      puts ""
    end
  end
end

board = Board.new
board.draw

#"\u{2657} "