require_relative 'piece'
require './moves_helper'

class Queen < Piece
  include MovesHelper
  def initialize(x, y, color)
    super(x, y, color)
  end
  
  def moves(board, player)
    moves = []
    moves += horizontal_moves(board, self)
    moves += vertical_moves(board, self)
    moves += diagonal_up(board, self)
    moves += diagonal_down(board, self)
  end

  def to_s
    super("\u{2655} ", "\u{265B} ")
  end
end