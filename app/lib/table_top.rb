module ToyRobot
  class TableTop
    attr_reader :left_boundary, :right_boundary, :top_boundary, :bottom_boundary
    def initialize(length = 5, breadth = 5)
      @left_boundary = @bottom_boundary = 0
      @right_boundary, @top_boundary = length - 1, breadth - 1
    end

    def is_within_bounds?(x = 0, y = 0)
      x.between?(@left_boundary, @right_boundary) &&
        y.between?(@bottom_boundary, @top_boundary)
    end
  end
end
