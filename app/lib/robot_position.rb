
class RobotPosition
  attr_reader :x_coord, :y_coord, :cardinal_direction
  CARDINALS = { south: :SOUTH, west: :WEST, north: :NORTH, east: :EAST }.freeze

  def initialize(x, y, cardinal)
    cardinal = cardinal.downcase.to_sym
    @cardinal_direction = CARDINALS[cardinal] if CARDINALS[cardinal]
    @x_coord = x, @y_coord = y
  end

  def change_cardinal_direction(dir)
    case @cardinal_direction
    when CARDINALS[:north]
      if dir == :left
        @cardinal_direction = CARDINALS[:west]
      elsif dir == :right
        @cardinal_direction = CARDINALS[:east]
      end
    when CARDINALS[:east]
      if dir == :left
        @cardinal_direction = CARDINALS[:north]
      elsif dir == :right
        @cardinal_direction = CARDINALS[:south]
      end
    when CARDINALS[:west]
      if dir == :left
        @cardinal_direction = CARDINALS[:south]
      elsif dir == :right
        @cardinal_direction = CARDINALS[:north]
      end
    when CARDINALS[:south]
      if dir == :left
        @cardinal_direction = CARDINALS[:east]
      elsif dir == :right
        @cardinal_direction = CARDINALS[:west]
      end
    else
      @cardinal_direction
    end
  end

  def coords
    [@x_coord, @y_coord]
  end

  def to_s
    "Position: #{coords.join(', ')} #{@cardinal_direction}"
  end

  def advance_position
    x_coord = @x_coord
    y_coord = @y_coord
    case @cardinal_direction
    when CARDINALS[:north]
      y_coord += 1
    when CARDINALS[:east]
      x_coord += 1
    when CARDINALS[:west]
      y_coord -= 1
    when CARDINALS[:south]
      x_coord -= 1
    else
      # type code here
    end
    { x_coord: x_coord, y_coord: y_coord }
  end
end
