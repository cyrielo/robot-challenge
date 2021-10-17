require_relative './position'

module ToyRobot
  class Robot
    attr_reader :table_top, :position

    def initialize(table_top)
      @table_top = table_top
    end

    def place(x_coord, y_coord, cardinal)
      x_coord = x_coord.to_i
      y_coord = y_coord.to_i
      if can_place?(x_coord, y_coord)
        @position = Position.new(x_coord, y_coord, cardinal)
      end
    end

    def report
      @position.to_s if is_placed?
    end

    def move
      return unless is_placed?
      position = @position.advance_position
      place(position.x_coord, position.y_coord, position.cardinal_direction)
    end

    def left
      rotate_cardinal(:left)
    end

    def right
      rotate_cardinal(:right)
    end

    private
    def is_placed?
      @position || false
    end

    def can_place?(x_coord, y_coord)
      @table_top.is_within_bounds?(x_coord, y_coord)
    end

    def rotate_cardinal(dir)
      @position.change_cardinal_direction(dir) if is_placed?
    end
  end
end
