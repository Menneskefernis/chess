require_relative 'piece'
require './moves_helper'

class Bishop < Piece
  include MovesHelper
  def initialize(x, y, color)
    super(x, y, color)
  end
  
  def moves
    moves = []

  end

  def to_s
    super("\u{2657} ", "\u{265D} ")
  end
end