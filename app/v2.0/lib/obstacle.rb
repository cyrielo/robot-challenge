module ToyRobotV2
  class Obstacle
    attr_reader :blocked_positions

    def initialize(board: TableTop)
      @table_top = board
      @blocked_positions = []
    end

    def obstruct(position: Position)
      block_pos = position.advance_position
      if @table_top.is_within_bounds?(block_pos.x_coord, block_pos.y_coord)
        @blocked_positions << block_pos
      end
    end

    def is_obstructing?(position: Position)
      @blocked_positions.any? { |pos| pos == position }
    end
  end
end
