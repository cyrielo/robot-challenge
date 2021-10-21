require_relative '../../../app/factory/robot_factory'
require_relative '../../shared_examples/a_robot'

RSpec.describe ToyRobot::Robot do

  let(:robot) { ToyRobot::Factory.create_robotv2 }
  subject { robot }

  it_should_behave_like "a Robot"

  context '#spawn' do
    it 'should spawn robot at random a place' do
      expect(subject.position.coords.any?).to be_falsy
      expect(subject.report).to be_nil
      subject.spawn
      expect(subject.report).to be_a(String)
      expect(subject.position.coords.any?).to be_truthy
    end
  end

  context '#obstruct' do
    it 'prevent robot from advancing to obstructed position' do
      subject.place(0, 3, 'NORTH')
      subject.obstruct
      subject.move
      subject.move
      expect(subject.report).to eql('0,3 NORTH')
      subject.place(0, 4, 'NORTH')
      expect(subject.report).to eql('0,3 NORTH')
    end
  end
end
