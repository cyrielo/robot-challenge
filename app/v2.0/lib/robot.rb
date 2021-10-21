require_relative '../../constants/application_constants'
require_relative '../../lib/robot'

module ToyRobotV2
  class Robot < ToyRobot::Robot
    attr_reader :obstacle

    def initialize(table_top: TableTop, position: Position, obstacle: Obstacle)
      super(table_top: table_top, position: position)
      @obstacle = obstacle
    end

    def spawn
      cardinal = ToyRobot::CARDINALS.keys.sample
      x_coord, y_coord = Array.new(2) { rand(@table_top.left..@table_top.top) }
      place(x_coord, y_coord, cardinal)
    end

    def obstruct
      @obstacle.obstruct(position: @position, table_top: @table_top)
      nil
    end

    def move
      pos = @position.advance_position
      super unless blocked?(pos)
    end

    def place(x_coord, y_coord, cardinal)
      pos = @position.class.new(x_coord, y_coord, cardinal)
      super unless blocked?(pos)
    end

    private

    def blocked?(position)
      @obstacle.obstructing?(position: position)
    end
  end
end
