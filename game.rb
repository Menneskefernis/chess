require_relative 'board'

class Game
  attr_accessor :board
  def initialize
    @board = Board.new
  end

  def intro
    puts "This is Chess! A game for smart people... why don't you just stop here?"
    puts
  end

  def start
    intro
    get_input
  end

  def get_input
    input = ""
    loop do
      puts "Please provide a row and a column you would like to select, ex. 'B3'"
      input = gets.chomp
      break if input_valid? input
    end
    input
  end

  def input_valid?(input)
    input.downcase!
    return false unless input.size == 2
    
    column, row = input.split('')
    return false unless ("a".."h").include?(column)
    return false unless (1..7).include?(row.to_i)
    true
  end
end

chess = Game.new
chess.start
#chess.board.draw