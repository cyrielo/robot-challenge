module ToyRobot
  class TableTop
    attr_reader :left, :right, :top, :bottom

    def initialize(length = 5, height = 5)
      @left = @bottom = 0
      @right = length - 1
      @top = height - 1
    end

    def within_bounds?(x_coord, y_coord)
      x_coord = Integer(x_coord)
      y_coord = Integer(y_coord)
      x_coord.between?(@left, @right) && y_coord.between?(@bottom, @top)
    rescue StandardError
      false
    end
  end
end
