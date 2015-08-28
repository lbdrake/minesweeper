require 'byebug'
require_relative 'board'
require_relative 'tile'

class Minesweeper

  def initialize#(difficult = easy)
    # easy, medium, hard = 9, 16, 20
    # @side_length = difficulty
    @board = Board.new
  end

end 

if __FILE__ == $PROGRAM_NAME
  game = Minesweeper.new
end
