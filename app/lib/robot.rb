require 'robot_position'

class Robot

  attr_accessor :robot_position
  attr_reader :table_top

  def initialize(table_top)
    @table_top = table_top
  end

  def place(x, y, cardinal)
    x = x.to_i, y = y.to_i
    if can_place?(x, y)
      @robot_position = RobotPosition.new(x, y, cardinal)
    end
  end

  def report
    @robot_position.to_s if is_placed?
  end

  def move
    return unless is_placed?
    coord = @robot_position.advance_position
    cardinal = @robot_position.cardinal_direction
    if can_place?(coord.x_coord, coord.y_coord)
      @robot_position = RobotPosition.new(coord.x_coord, coord.y_coord,cardinal)
    end
  end

  def left
    rotate_cardinal(:left)
  end

  def right
    rotate_cardinal(:right)
  end

  def is_placed?
    @robot_position.any? || false
  end

  def can_place?(x_coord, y_coord)
    @table_top.is_within_bounds?(x_coord, y_coord)
  end

  def rotate_cardinal(dir)
    @robot_position.change_cardinal_direction(dir) if is_placed?
  end
end
