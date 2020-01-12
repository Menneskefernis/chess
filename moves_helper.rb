module MovesHelper
  def horizontal_moves(board, piece)
    moves = []
    moves += moves_right(board, piece)
    moves += moves_left(board, piece)
  end

  def vertical_moves(board, piece)
    moves = []
    moves += moves_up(board, piece)
    moves += moves_down(board, piece)
  end

  def moves_up(board, piece)
    moves = []
    current = piece

    while current.y < board.state[0].size - 1
      current = board.state[current.x][current.y + 1]
      moves << [current.x, current.y]
    end
    moves
  end

  def moves_down(board, piece)
    moves = []
    current = piece

    while current.y > 0
      current = board.state[current.x][current.y - 1]
      moves << [current.x, current.y]
    end
    moves
  end

  def moves_right(board, piece)
    moves = []
    current = piece

    while current.x < board.state.size - 1
      current = board.state[current.x + 1][current.y]
      moves << [current.x, current.y]
    end
    moves
  end

  def moves_left(board, piece)
    moves = []
    current = piece

    while current.x > 0
      current = board.state[current.x - 1][current.y]
      moves << [current.x, current.y]
    end
    moves
  end
end