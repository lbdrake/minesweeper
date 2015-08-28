class Minesweeper

  def initialize#(difficult = easy)
    # easy, medium, hard = 9, 16, 20
    # @side_length = difficulty
    @board = Board.new
  end
end # end of Minesweeper class

#-------------------------------------------------

class Board
  attr_accessor :grid

  def initialize(side_length = 9)
    @grid = Array.new(side_length) { Array.new(side_length) }
    populate_bombs
    populate_non_bombs
  end

  def populate_bombs
    bomb_positions = []

    until bomb_positions.length == 10
      50.times {bomb_positions << [rand(9),rand(9)]}
      bomb_positions.uniq!
      bomb_positions = bomb_positions.take(10)
    end
    p bomb_positions
    # (side_length * 2).times do |x|

    #put tile instance in each position
    bomb_positions.each do |coordinates|
      @grid[coordinates[0]][coordinates[1]] = Tile.new(@board, bombed: true)

      @grid [0][0]
    end
  end

  def populate_non_bombs

  end

  #9x9 grid
end #end of Board class

#-------------------------------------------------


class Tile
  #bombed, flagged, revealed, neighbors


  def initialize(board, options = { })

    defaults = {
      flagged: false,
      revealed: false,
      bombed: false
    }

    options = defaults.merge(options)

    # flag if flagged
    # bomb if bombed
    # reveal if revealed

  end

  #methods reveal, neighbords, neighbor bomb count, flag, bomb,

  def inspect
    #only show what we want
  end
end

#-------------------------------------------------

if __FILE__ == $PROGRAM_NAME
  game = Minesweeper.new
end
