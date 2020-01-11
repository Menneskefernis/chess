require_relative 'board'

class Game
  attr_accessor :board
  def initialize
    @board = Board.new
  end

  def intro
    puts "This is Chess! A game for smart people... why don't you just stop here?"
  end

  def start
    intro
    get_input
  end

  def get_input
    input = ""
    loop do
      input = gets.chomp
      break if input_valid?
    end
    input
  end
  
end

chess = Game.new
chess.board.draw