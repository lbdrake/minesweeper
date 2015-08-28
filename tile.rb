
class Tile
  attr_accessor :options, :bombed, :flagged
  attr_accessor :revealed, :neighbors, :value, :position, :board


  def initialize(board, options = { })

    defaults = {
      flagged: false,
      revealed: false,
      bombed: false,
      value: nil,
      position: nil
    }

    tile_properties = defaults.merge(options)
    @flagged = tile_properties[:flagged]
    @bombed = tile_properties[:bombed]
    @revealed = tile_properties[:revealed]
    @value = tile_properties[:value]
    @position = tile_properties[:position]
    @board = board
    counting_neighbors unless self.bombed
  end

  def counting_neighbors
    bomb_count = 0
    positions_to_check = [[1,0],[1,1],[0,1],[-1,1],[-1,0],[-1,-1],[0,-1],[1,-1]]

    positions_to_check.each do |pos|
       temp_x = @position[0] + pos[0]
       temp_y = @position[1] + pos[1]
       temp_tile = @board.grid[temp_x][temp_y]
      #  next if temp_tile.nil?
      bomb_count += 1 if temp_tile.bombed
     end
     self.value = bomb_count
   end

  #methods reveal, neighbors, neighbor bomb count, flag, bomb,

  def to_s #to make p method work
    bomb = "\u00A5".encode('utf-8')
    flag = "\u0569".encode('utf-8')
    blank = "\u047A".encode('utf-8')

    #only show what we want
    #if it's flagged, show 'U0569' = flag
    #if it's revealed, show value
    return nil if self.is_a?(Array) || self.nil?
    if @tile_properties[:revealed]
      if @tile_properties[:bombed]
        bomb
      else
        @tile_properties[:value]
      end
    end

    if @tile_properties[:flagged]
      flag
    else
      blank
    end
  end

  def inspect
    "#<Tile #{@tile_properties[:value]}>"
  end

end
