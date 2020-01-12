module MovesHelper
  def horizontal_moves(game_board, piece)
    moves = []
    moves += moves_right(game_board, piece)
    moves += moves_left(game_board, piece)
  end

  def moves_right(game_board, piece)
    moves = []
    board = game_board.state
    current = piece

    while current.x < board.size - 1
      current = board[current.x + 1][current.y]
      moves << [current.x, current.y]
    end
    moves
  end

  def moves_left(game_board, piece)
    moves = []
    board = game_board.state
    current = piece

    while current.x > 0
      current = board[current.x - 1][current.y]
      moves << [current.x, current.y]
    end
    moves
  end

  def vertical_moves(game_board, piece)
    moves = []
    moves += moves_up(game_board, piece)
    moves += moves_down(game_board, piece)
  end

  def moves_up(game_board, piece)
    moves = []
    board = game_board.state
    current = piece

    while current.y < board[0].size - 1
      current = board[current.x][current.y + 1]
      moves << [current.x, current.y]
    end
    moves
  end

  def moves_down(game_board, piece)
    moves = []
    board = game_board.state
    current = piece

    while current.y > 0
      current = board[current.x][current.y - 1]
      moves << [current.x, current.y]
    end
    moves
  end

  def diagonal_up(game_board, piece)
    moves = []
    board = game_board.state
    current = piece

    while current.x < board.size - 1 && current.y < board[0].size - 1
      current = board[current.x + 1][current.y + 1]
      moves << [current.x, current.y]
    end

    current = piece

    while current.x > 0 && current.y > 0
      current = board[current.x - 1][current.y - 1]
      moves << [current.x, current.y]
    end
    moves
  end

  def diagonal_down(game_board, piece)
    moves = []
    board = game_board.state
    current = piece

    while current.x < board.size - 1 && current.y > 0
      current = board[current.x + 1][current.y - 1]
      moves << [current.x, current.y]
    end

    current = piece

    while current.x > 0 && current.y < board[0].size - 1
      current = board[current.x - 1][current.y + 1]
      moves << [current.x, current.y]
    end
    moves
  end
end