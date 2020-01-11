require_relative 'square'

KING_WHITE = "\u{2654} "
QUEEN_WHITE = "\u{2655} "
ROOK_WHITE = "\u{2656} "
BISHOP_WHITE = "\u{2657} "
KNIGHT_WHITE = "\u{2658} "
PAWN_WHITE = "\u{2659} "
KING_BLACK = "\u{265A} "
QUEEN_BLACK = "\u{265B} "
ROOK_BLACK = "\u{265C} "
BISHOP_BLACK = "\u{265D} "
KNIGHT_BLACK = "\u{265E} "
PAWN_BLACK = "\u{265F} "

#"\u{2657} "

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
    puts ""
    (state[0].size - 1).downto(0) do |i|
      state.each do |row|
        print row[i]
      end
      puts ""
    end
    puts ""
  end

  def set_up_board
    pieces_white = [ROOK_WHITE, KNIGHT_WHITE, BISHOP_WHITE, KING_WHITE, QUEEN_WHITE, BISHOP_WHITE, KNIGHT_WHITE, ROOK_WHITE]
    pieces_black = [ROOK_BLACK, KNIGHT_BLACK, BISHOP_BLACK, QUEEN_BLACK, KING_BLACK, BISHOP_BLACK, KNIGHT_BLACK, ROOK_BLACK]
    
    add_pieces(1, PAWN_WHITE)
    add_pieces(6, PAWN_BLACK)
    add_pieces(0, pieces_white)
    add_pieces(7, pieces_black)
  end

  def add_pieces(row, content)
    8.times do |i|
      if content.is_a? Array
        state[i][row].piece = content[i]
      else
        state[i][row].piece = content
      end
    end
  end
end

board = Board.new
board.set_up_board
board.draw

