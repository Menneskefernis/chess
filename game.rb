require_relative 'board'

class Game
  attr_accessor :board
  def initialize
    @board = Board.new
  end

  def intro
    puts "This is Chess! A game for smart people... why don't you just stop here?\n\n"
  end

  def start
    intro
    play_round
  end

  def play_round
    board.draw
    input = get_input
    origin_square = select_square(input)

    if origin_square.piece.nil? #or the piece doesn't have the right color
      puts "\n\nThere's no piece of your color on this square\n\n"
      get_input
    else
      puts "Where would you like to move your piece?"
      input = get_input
      move_piece(input, origin_square)
    end
    board.draw
  end

  def move_piece(input, origin_square)
    piece = origin_square.piece
    origin_square.piece = nil
    move_to_square = select_square(input)
    move_to_square.piece = piece
  end

  def select_square(input)
    column, row = input.downcase.split('')
    board.state[letter_to_int(column)][row.to_i - 1]
  end

  def letter_to_int(letter)
    case letter
    when "a"
        0
    when "b"
        1
    when "c"
        2
    when "d"
        3
    when "e"
        4
    when "f"
        5
    when "g"
        6
    when "h"
        7
    end
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
    #input.downcase!
    return false unless input.size == 2
    
    column, row = input.downcase.split('')
    return false unless ("a".."h").include?(column)
    return false unless (1..7).include?(row.to_i)
    true
  end
end

chess = Game.new
chess.start
#chess.board.draw