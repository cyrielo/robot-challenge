require_relative '../../app/lib/robot_position'

RSpec.describe ToyRobot::RobotPosition do
  before(:example) do
    @x_coord = 0
    @y_coord = 0
    @cardinal = 'WEST'
    @robot_position = ToyRobot::RobotPosition.new(@x_coord, @y_coord, @cardinal)
  end

  context '#change_cardinal_direction' do
    it 'rotates the cardinal direction 90 left and right' do
      @robot_position.change_cardinal_direction(:left)
      expect(@robot_position.cardinal_direction).to eql(:SOUTH)

      @robot_position.change_cardinal_direction(:right)
      expect(@robot_position.cardinal_direction).to eql(@cardinal.to_sym)

      @robot_position.change_cardinal_direction(:right)
      @robot_position.change_cardinal_direction(:right)
      @robot_position.change_cardinal_direction(:right)
      @robot_position.change_cardinal_direction(:left)
      expect(@robot_position.cardinal_direction).to eql(:EAST)
    end
  end
  context '#to_s' do
    it 'should return a string announcing  X,Y and cardinal of the robot' do
      expect(@robot_position.to_s
      ).to eql("#{@robot_position.coords.join(',')} #{@cardinal}")
    end

  end

  context '#advance_position' do
    it 'expects coordinates to increase as position advance' do
      coordinates = @robot_position.advance_position
      expect(coordinates[:x_coord]).to eql(@x_coord - 1)
      expect(coordinates[:y_coord]).to eql(@y_coord)

      @robot_position.change_cardinal_direction(:right)

      coordinates = @robot_position.advance_position
      expect(coordinates[:x_coord]).to eql(@x_coord)
      expect(coordinates[:y_coord]).to eql(@y_coord + 1)
    end
  end
end