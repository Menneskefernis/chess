require_relative 'piece'
require './moves_helper'

class Rook < Piece  
  include MovesHelper
  
  def initialize(x, y, color)
    super(x, y, color)
  end
  
  def moves(board, player)
    moves = []
    moves += horizontal_moves(board, self)
    moves += vertical_moves(board, self)
  end

  def to_s
    super("\u{2656} ", "\u{265C} ")
  end
end