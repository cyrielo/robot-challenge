require_relative '../../../app/factory/robot_factory'
require_relative '../../shared_examples/a_robot'

RSpec.describe ToyRobot::Robot do

  let(:robot) { ToyRobot::Factory.create_robotv2 }
  subject { robot }

  it_should_behave_like "a Robot"  
end
