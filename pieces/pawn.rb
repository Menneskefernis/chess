require_relative 'piece'

class Pawn < Piece
  attr_accessor :first_move

  def initialize(x, y, color)
    super(x, y, color)
  
    @first_move = true
  end
  
  def moves(board, player)
    moves = []
    operator = "+"
    operator = "-" if color == "black"
    
    moves += opponent_squares(board, player)

    if board.state[x][y.send(operator, 1)].piece.nil?
      moves << [x, y.send(operator, 1)] 
      moves << [x, y.send(operator, 2)]
    end
    moves
  end

  def opponent_squares(board, player)
    moves = []
    diagonal_squares = find_diagonal_squares(board, player)
    
    diagonal_squares.each do |square|
      next if square.nil?
      if square.piece.is_a? Piece
        moves << [square.x, square.y] unless board.state[square.x][square.y].piece.color == player.color
      end
    end
    moves
  end

  def find_diagonal_squares(board, player)
    diagonal_squares = []
    opponent_left = nil
    opponent_right = nil

    if player.color == "white"
      opponent_left = board.state[x - 1][y + 1] if x > 0
      opponent_right = board.state[x + 1][y + 1] if x < board.state.size - 1
    else
      opponent_left = board.state[x - 1][y - 1] if x > 0
      opponent_right = board.state[x + 1][y - 1] if x < board.state.size - 1
    end
    
    diagonal_squares.push(opponent_left, opponent_right)
  end

  def to_s
    super("\u{2659} ", "\u{265F} ")
  end
end