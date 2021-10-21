require_relative '../../app/factory/robot_factory'
require_relative '../../app/lib/robot'
require_relative '../../app/v2.0/lib/robot'
require_relative '../../app/lib/position'
require_relative '../../app/lib/table_top'
require_relative '../../app/v2.0/lib/obstacle'
require_relative '../../app/application'
require_relative '../../app/v2.0/application'
require_relative '../../app/lib/io/reader'
require_relative '../../app/lib/io/writer'

RSpec.describe ToyRobot::Factory do
  context 'should create application models' do
    it "should create_robot" do
      expect(ToyRobot::Factory.create_robot).to be_a(ToyRobot::Robot)
    end
    it "should create_robotv2" do
      expect(ToyRobot::Factory.create_robotv2).to be_a(ToyRobotV2::Robot)
    end
    it "should create_obstacle" do
      expect(ToyRobot::Factory.create_obstacle).to be_a(ToyRobotV2::Obstacle)
    end
    it "should create_tabletop" do
      expect(ToyRobot::Factory.create_tabletop).to be_a(ToyRobot::TableTop)
    end
    it "should create_position" do
      expect(ToyRobot::Factory.create_position).to be_a(ToyRobot::Position)
    end
    it "should create_application" do
      expect(ToyRobot::Factory.create_application).to be_a(ToyRobot::Application)
    end
    it "should create_application_v2" do
      expect(ToyRobot::Factory.create_application_v2).to be_a(ToyRobotV2::Application)
    end
    it "should create_writer" do
      expect(ToyRobot::Factory.create_writer).to be_a(ToyRobot::Writer)
    end
    it "should create_reader" do
      expect(ToyRobot::Factory.create_reader).to be_a(ToyRobot::Reader)
    end
  end
end
