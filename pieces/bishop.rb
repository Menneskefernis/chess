require_relative 'piece'
require './moves_helper'

class Bishop < Piece
  include MovesHelper
  def initialize(x, y, color)
    super(x, y, color)
  end
  
  def moves(board, player)
    moves = []
    moves += diagonal_up(board, self)
    moves += diagonal_down(board, self)
  end

  def to_s
    super("\u{2657} ", "\u{265D} ")
  end
end