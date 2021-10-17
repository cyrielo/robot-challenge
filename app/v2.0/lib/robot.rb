require_relative '../../lib/robot'
require_relative '../../constants/application_constants'
require_relative './obstacle'

module ToyRobotV2
  class Robot < ToyRobot::Robot
    attr_reader :obstacle
    def initialize(table_top)
      super(table_top)
      @obstacle = Obstacle.new(@table_top)
    end

    def spawn
      cardinal = ToyRobot::CARDINALS.keys.sample
      x_coord, y_coord = Array.new(2) { rand(@table_top.left..@table_top.top) }
      place(x_coord, y_coord, cardinal)
    end

    def place(x_coord, y_coord, cardinal)
      super(x_coord, y_coord, cardinal) unless is_blocked?
    end

    def obstruct
      @obstacle.obstruct(@position)
    end

    def is_blocked?
      @obstacle.is_obstructing?(@position)
    end
  end
end
