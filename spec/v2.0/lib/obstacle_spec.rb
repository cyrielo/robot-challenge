require_relative '../../../app/factory/robot_factory'

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
  end
end