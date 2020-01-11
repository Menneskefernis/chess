require_relative 'piece'

class Rook < Piece  
    def initialize(x, y, color)
      super(x, y, color)
    end
    
    def possible_moves
      moves = []
      
    end
  
    def to_s
      super("\u{2656} ", "\u{265C} ")
    end
  end