module ToyRobotV2
  class Obstacle
    attr_reader :blocked_positions

    def initialize
      @blocked_positions = []
    end

    def obstruct(position: Position, table_top: TableTop)
      block_pos = position.advance_position
      @blocked_positions << block_pos if table_top.within_bounds?(block_pos.x_coord, block_pos.y_coord)
    end

    def obstructing?(position: Position)
      @blocked_positions.any? { |pos| pos == position }
    end
  end
end
