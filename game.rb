require 'colorize'
require_relative 'board'
require_relative 'player'

class Game
  attr_accessor :board, :game_end, :current_player
  attr_reader :player1, :player2
  def initialize
    @board = Board.new
    @player1 = Player.new("white")
    @player2 = Player.new("black")
    @current_player = player1
    @game_end = false
  end

  def intro
    puts "This is Chess! A game for smart people... why don't you just stop here?\n\n"
    puts "Player 1, can we get a name?"
    #player1.name = gets.chomp
    puts player1.color
    puts "\nPlayer 2, would you mind as well?"
    #player2.name = gets.chomp
    puts player2.color
  end

  def start
    intro
    play_round until game_end
  end

  def play_round
    board.draw
    puts "What piece you wanna move?\n"
    input = get_input
    start_square = select_square(input)

    if start_square.piece.nil? || start_square.piece.color != current_player.color
      puts "\nThere's no piece of your color on this square\n".red
      play_round
    else
      handle_target_input(start_square)
    end
  end

  def handle_target_input(start_square)
    puts "\nWhere would you like to move your piece?\n".light_blue
    input = get_input
    target_square = select_square(input)
    if start_square.piece.moves.include?([target_square.x, target_square.y])
      move_piece(start_square, target_square)
    else
      puts "\n\nYou can't move there!".red
      board.draw
      handle_target_input(start_square)
    end
  end

  def move_piece(start_square, target_square)
    piece = start_square.piece
    
    start_square.piece = nil
    target_square.piece = piece
    
    piece.x = target_square.x
    piece.y = target_square.y
    
    piece.first_move = false if piece.is_a? Pawn
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
      puts "Please enter row and column (ex. 'B3' or 'F6'), " + "#{current_player.name}".green
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