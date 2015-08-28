
class Board
  attr_reader :grid

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

    bomb_positions.each do |coordinates|

      @grid[coordinates[0]][coordinates[1]] =
                Tile.new(self, bombed: true, position: coordinates)
    end
  end

  def populate_non_bombs
    @grid.each_with_index do |row,i|
      row.each_with_index do |cell,j|
        @grid[i][j] = Tile.new(self, position: [i,j]) if cell.nil?
      end
    end
  end
end
