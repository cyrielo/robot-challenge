require_relative '../helpers/validation_helper'

module ToyRobot
  class TableTop
    attr_reader :left_boundary, :right_boundary, :top_boundary, :bottom_boundary
    def initialize(length = 5, breadth = 5)
      @left_boundary = @bottom_boundary = 0
      @right_boundary, @top_boundary = length - 1, breadth - 1
    end

    def is_within_bounds?(x_coord, y_coord)
      return false unless ValidationHelper::is_valid_integer?(x_coord, y_coord)
      x_coord.between?(@left_boundary, @right_boundary) &&
        y_coord.between?(@bottom_boundary, @top_boundary)
    end
  end
end
