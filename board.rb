require_relative 'square'
require './pieces/pawn'
require './pieces/rook'
require './pieces/knight'
require './pieces/bishop'
require './pieces/queen'
require './pieces/king'

class Board
  attr_accessor :state
  
  def initialize
    @state = create_board(8, 8)
    prepare_board
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
    puts ""
    (state[0].size - 1).downto(0) do |i|
      print (i + 1).to_s + " "
      state.each do |row|
        print row[i]
      end
      puts ""
    end
    puts "  A B C D E F G H\n\n"
  end

  def prepare_board
    pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

    add_pieces(Pawn, 1, "white")
    add_pieces(Pawn, 6, "black")
    add_pieces(pieces, 0, "white")
    add_pieces(pieces, 7, "black")
  end

  def add_pieces(pieces, row, color)
    8.times do |i|
      if pieces.is_a? Array
        state[i][row].piece = pieces[i].new(i, row, color)
      else
        state[i][row].piece = pieces.new(i, row, color)
      end
    end
  end
end

#board = Board.new
#board.draw
#puts board.state[0][0].piece.class

