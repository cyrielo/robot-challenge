require_relative '../helpers/validation_helper'

module ToyRobot
  class TableTop
    attr_reader :left, :right, :top, :bottom
    def initialize(length = 5, height = 5)
      @left = @bottom = 0
      @right, @top = length - 1, height - 1
    end

    def is_within_bounds?(x_coord, y_coord)
      return false unless ValidationHelper::is_valid_integer?(x_coord, y_coord)
      x_coord.between?(@left, @right) &&
        y_coord.between?(@bottom, @top)
    end
  end
end
