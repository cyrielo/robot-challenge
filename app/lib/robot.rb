require_relative './robot_position'

module ToyRobot
  class Robot
    attr_reader :table_top, :robot_position

    def initialize(table_top)
      @table_top = table_top
    end

    def place(x_coord, y_coord, cardinal)
      x_coord = x_coord.to_i
      y_coord = y_coord.to_i
      if can_place?(x_coord, y_coord)
        @robot_position = RobotPosition.new(x_coord, y_coord, cardinal)
      end
    end

    def report
      @robot_position.to_s if is_placed?
    end

    def move
      return unless is_placed?
      coord = @robot_position.advance_position
      cardinal = @robot_position.cardinal_direction
      place(coord[:x_coord], coord[:y_coord], cardinal)
    end

    def left
      rotate_cardinal(:left)
    end

    def right
      rotate_cardinal(:right)
    end

    private
    def is_placed?
      @robot_position || false
    end

    def can_place?(x_coord, y_coord)
      @table_top.is_within_bounds?(x_coord, y_coord)
    end

    def rotate_cardinal(dir)
      @robot_position.change_cardinal_direction(dir) if is_placed?
    end
  end
end
