require_relative '../../lib/position'
module ToyRobotV2
  class Obstacle
    attr_reader :blocked_positions

    def initialize(table_top)
      @table_top = table_top
      @blocked_positions = []
    end

    def obstruct(position)
      block_pos = position.advance_position
      if @table_top.is_within_bounds?(block_pos.x_coord, block_pos.y_coord)
        @blocked_positions << block_pos
      end
    end

    def is_obstructing?(position)
      @blocked_positions.any? { |pos| pos == position }
    end
  end
end