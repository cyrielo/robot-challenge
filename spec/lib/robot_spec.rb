require_relative '../../app/lib/robot'
require_relative '../../app/lib/table_top'

RSpec.describe ToyRobot::Robot do
  before(:example) do
    @table_top = ToyRobot::TableTop.new(5, 3)
    @robot = ToyRobot::Robot.new(@table_top)
  end

  context '#place' do
    it 'prevents placing robot on table with invalid positioning' do
      expect(@robot.table_top).eql?(@table_top)
      @robot.place(5, 5, 'west')
      expect(@robot.robot_position).to be_nil
    end

    it 'should place robot with valid coordinates and cardinal direction' do
      @robot.place(4, 2, 'north')
      expect(@robot.robot_position.cardinal_direction).to eql(:NORTH)
      expect(@robot.robot_position.x_coord).to eql(4)
      expect(@robot.robot_position.y_coord).to eql(2)
    end
  end

  context '#report' do
    it 'should report robot coordinates and cardinal point' do
      coords = [4, 2]
      cardinal = 'NORTH'
      @robot.place(*coords, cardinal)
      expect(@robot.report).to eql( "#{coords.join(',')} #{cardinal}")
    end
  end

  context '#move' do
    it 'it should advance robot position at cardinal direction' do
      x = 0
      y = 0
      cardinal = 'north'
      @robot.place(x, y, cardinal)
      @robot.move
      @robot.move
      expect(@robot.robot_position.y_coord).to eql(y + 2)
      expect(@robot.robot_position.x_coord).to eql(x)
    end

    it 'it should not advance robot position if beyond table-top boundary' do
      x = 0
      y = 0
      cardinal = 'west'
      @robot.place(x, y, cardinal)
      @robot.move
      @robot.move
      expect(@robot.robot_position.y_coord).to eql(y)
      expect(@robot.robot_position.x_coord).to eql(x)
    end
  end

  context '#left' do
    it 'should rotate robot 90 degree left' do
      x = 0
      y = 0
      cardinal = 'east'
      @robot.place(x, y, cardinal)
      @robot.left
      expect(@robot.robot_position.cardinal_direction).to eql(:NORTH)
      expect(@robot.robot_position.y_coord).to eql(y)
      expect(@robot.robot_position.x_coord).to eql(x)
    end
  end

  context '#right' do
    it 'should rotate robot 90 degree right' do
      x = 0
      y = 0
      cardinal = 'east'
      @robot.place(x, y, cardinal)
      @robot.right
      expect(@robot.robot_position.cardinal_direction).to eql(:SOUTH)
      expect(@robot.robot_position.y_coord).to eql(y)
      expect(@robot.robot_position.x_coord).to eql(x)
    end
  end
end
