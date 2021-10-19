require_relative '../../app/factory/toy_robot'

RSpec.describe ToyRobot::Robot do
  before(:example) do
    @robot = ToyRobot::Factory.create_robot
  end

  context '#place' do
    it 'prevents placing robot on table with invalid positioning' do
      expect(@robot.table_top).eql?(@table_top)
      @robot.place(5, 5, 'west')
      expect(@robot.position.coords.empty?).to be true
    end

    it 'should place robot with valid coordinates and cardinal direction' do
      @robot.place(4, 2, 'north')
      expect(@robot.position.cardinal_direction).to eql(:NORTH)
      expect(@robot.position.x_coord).to eql(4)
      expect(@robot.position.y_coord).to eql(2)
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
      expect(@robot.position.y_coord).to eql(y + 2)
      expect(@robot.position.x_coord).to eql(x)
      expect(@robot.position.cardinal_direction.downcase.to_s).to eql(cardinal)
    end

    it 'it should not advance robot position if beyond table-top boundary' do
      x = 0
      y = 0
      cardinal = 'west'
      @robot.place(x, y, cardinal)
      @robot.move
      @robot.move
      expect(@robot.position.y_coord).to eql(y)
      expect(@robot.position.x_coord).to eql(x)
    end
  end

  context '#left' do
    it 'should rotate robot 90 degree left' do
      x = 0
      y = 0
      cardinal = 'east'
      @robot.place(x, y, cardinal)
      @robot.left
      expect(@robot.position.cardinal_direction).to eql(:NORTH)
      expect(@robot.position.y_coord).to eql(y)
      expect(@robot.position.x_coord).to eql(x)
    end
  end

  context '#right' do
    it 'should rotate robot 90 degree right' do
      x = 0
      y = 0
      cardinal = 'east'
      @robot.place(x, y, cardinal)
      @robot.right
      expect(@robot.position.cardinal_direction).to eql(:SOUTH)
      expect(@robot.position.y_coord).to eql(y)
      expect(@robot.position.x_coord).to eql(x)
    end
  end
end
