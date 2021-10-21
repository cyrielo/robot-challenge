require_relative '../constants/application_constants'

module ToyRobot
  class Robot
    attr_reader :table_top, :position

    def initialize(table_top: TableTop, position: Position)
      @table_top = table_top
      @position = position
    end

    def place(x_coord, y_coord, cardinal)
      if valid_place?(x_coord, y_coord, cardinal)
        x_coord = x_coord.to_i
        y_coord = y_coord.to_i
        @position = @position.class.new(x_coord, y_coord, cardinal) if can_place?(x_coord, y_coord)
      end
      nil
    end

    def report
      @position.to_s if placed?
    end

    def move
      return unless placed?

      position = @position.advance_position
      place(position.x_coord, position.y_coord, position.cardinal_direction)
    end

    def left
      rotate_cardinal(:left)
    end

    def right
      rotate_cardinal(:right)
    end

    protected

    def placed?
      coords = @position.coords
      cardinal = @position.cardinal_direction
      coords.empty? || cardinal.nil? ? false : true
    end

    def can_place?(x_coord, y_coord)
      @table_top.within_bounds?(x_coord, y_coord)
    end

    def rotate_cardinal(dir)
      @position.change_cardinal_direction(dir) if placed?
    end

    def valid_place?(x_coord, y_coord, cardinal)
      valid_integers = begin
        Integer(x_coord) && Integer(y_coord)
      rescue StandardError
        false
      end
      cardinal = cardinal.to_sym if cardinal.is_a?(String)
      cardinal = cardinal.downcase if cardinal.respond_to?(:downcase)
      valid_integers && CARDINALS.key?(cardinal)
    end
  end
end
