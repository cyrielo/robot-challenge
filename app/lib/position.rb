require_relative '../constants/application_constants'

module ToyRobot
  class Position
    attr_reader :x_coord, :y_coord, :cardinal_direction

    def initialize(x_coord = nil, y_coord = nil, cardinal = nil)
      cardinal = cardinal.downcase.to_sym if cardinal
      @cardinal_direction = CARDINALS[cardinal]
      @x_coord = x_coord
      @y_coord = y_coord
    end

    def change_cardinal_direction(dir)
      case @cardinal_direction
      when CARDINALS[:north]
        if dir == :left
          @cardinal_direction = CARDINALS[:west]
        elsif dir == :right
          @cardinal_direction = CARDINALS[:east]
        end
      when CARDINALS[:east]
        if dir == :left
          @cardinal_direction = CARDINALS[:north]
        elsif dir == :right
          @cardinal_direction = CARDINALS[:south]
        end
      when CARDINALS[:west]
        if dir == :left
          @cardinal_direction = CARDINALS[:south]
        elsif dir == :right
          @cardinal_direction = CARDINALS[:north]
        end
      when CARDINALS[:south]
        if dir == :left
          @cardinal_direction = CARDINALS[:east]
        elsif dir == :right
          @cardinal_direction = CARDINALS[:west]
        end
      else
        @cardinal_direction
      end
    end

    def coords
      return [] if @x_coord.nil? || @y_coord.nil?

      [@x_coord, @y_coord]
    end

    def to_s
      "#{coords.join(',')} #{@cardinal_direction}"
    end

    def advance_position
      x_coord = @x_coord
      y_coord = @y_coord
      case @cardinal_direction
      when CARDINALS[:north]
        y_coord += 1 if y_coord
      when CARDINALS[:east]
        x_coord += 1 if x_coord
      when CARDINALS[:west]
        x_coord -= 1 if x_coord
      when CARDINALS[:south]
        y_coord -= 1 if y_coord
      else
        # type code here
      end
      Position.new(x_coord, y_coord, @cardinal_direction)
    end

    def ==(other)
      return false unless other.is_a?(Position)

      (other.x_coord == @x_coord && other.y_coord == @y_coord && other.cardinal_direction == @cardinal_direction)
    end
  end
end
