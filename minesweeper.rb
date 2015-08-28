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
    p @grid
  end

  def populate_bombs
    bomb_positions = []

    until bomb_positions.length == 10
      50.times {bomb_positions << [rand(9),rand(9)]}
      bomb_positions.uniq!
      bomb_positions = bomb_positions.take(10)
    end
    # (side_length * 2).times do |x|

    #put tile instance in each position
    bomb_positions.each do |coordinates|
      @grid[coordinates[0]][coordinates[1]] = Tile.new(@board, bombed: true)
      # p @grid[coordinates[0]][coordinates[1]]
      # @grid[0][0]

      # output = @grid.map {|row| row.each {|col| col.inspect}}
      # puts output
    end
  end

  def populate_non_bombs
    @grid.each_with_index do |x,i|
      x.each_with_index do |y,o|
        @grid[i][o] = Tile.new(@board) if y.nil?
      end
    end
  end

  #9x9 grid
end #end of Board class

#-------------------------------------------------


class Tile
  attr_accessor :options#:bombed, :flagged, :revealed, :neighbors, :value,


  def initialize(board, options = { })

    defaults = {
      flagged: false,
      revealed: false,
      bombed: false,
      value: 0
    }

    @tile_properties = defaults.merge(options)
    if !@tile_properties[:bombed] #check neighbors and assign value
    # flag if flagged
    # bomb if bombed
    # reveal if revealed
    end

  end

  #methods reveal, neighbors, neighbor bomb count, flag, bomb,

  def inspect #to make p method work
    #only show what we want
    #if it's flagged, show 'U0569' = flag
    #if it's revealed, show value
    return nil if self.is_a?(Array) || self.nil?
    if @tile_properties[:revealed]
      if @title_properties[:bombed]
        return "\u00A5".encode('utf-8')
      else
        return @tile_properties[:value]
      end
    end

    if @title_properties[:flagged]
      "\u0569".encode('utf-8')
    else
      "\u047A".encode('utf-8')
    end
  end

end

#-------------------------------------------------

if __FILE__ == $PROGRAM_NAME
  game = Minesweeper.new
end
