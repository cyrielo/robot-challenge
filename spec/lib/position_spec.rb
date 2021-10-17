require_relative '../../app/lib/position'

RSpec.describe ToyRobot::Position do
  before(:example) do
    @x_coord = 0
    @y_coord = 0
    @cardinal = 'WEST'
    @position = ToyRobot::Position.new(@x_coord, @y_coord, @cardinal)
  end

  context '#change_cardinal_direction' do
    it 'rotates the cardinal direction 90 left and right' do
      @position.change_cardinal_direction(:left)
      expect(@position.cardinal_direction).to eql(:SOUTH)

      @position.change_cardinal_direction(:right)
      expect(@position.cardinal_direction).to eql(@cardinal.to_sym)

      @position.change_cardinal_direction(:right)
      @position.change_cardinal_direction(:right)
      @position.change_cardinal_direction(:right)
      @position.change_cardinal_direction(:left)
      expect(@position.cardinal_direction).to eql(:EAST)
    end
  end
  context '#to_s' do
    it 'should return a string announcing  X,Y and cardinal of the robot' do
      expect(@position.to_s
      ).to eql("#{@position.coords.join(',')} #{@cardinal}")
    end

  end

  context '#advance_position' do
    it 'expects coordinates to increase as position advance' do
      position = @position.advance_position
      expect(position.x_coord).to eql(@x_coord - 1)
      expect(position.y_coord).to eql(@y_coord)

      @position.change_cardinal_direction(:right)

      position = @position.advance_position
      expect(position.x_coord).to eql(@x_coord)
      expect(position.y_coord).to eql(@y_coord + 1)
    end
  end
end