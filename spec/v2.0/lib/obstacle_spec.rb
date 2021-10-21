require_relative '../../../app/factory/robot_factory'

RSpec.describe ToyRobot::Robot do
  let(:obstacle) { ToyRobot::Factory.create_obstacle }
  let(:position) { ToyRobot::Factory.create_position(0, 0, 'north') }
  let(:table_top) { ToyRobot::Factory.create_tabletop }

  subject { obstacle }

  specify "properties" do
    should respond_to(:blocked_positions)
  end

  context '#obstruct' do
    it 'should be able to prevent position from advancing after obstructing' do
      subject.obstruct(position: position, table_top: table_top)
      expect(subject.blocked_positions).to include(position.advance_position)
    end
  end

  context '#is_obstructing?' do
    it 'assert if a position is obstructed' do
      subject.obstruct(position: position, table_top: table_top)
      pos = position.advance_position
      expect(subject.is_obstructing?(position: pos)).to be true
    end
  end
end
