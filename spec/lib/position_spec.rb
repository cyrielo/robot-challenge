require_relative '../../app/factory/robot_factory'


RSpec.describe ToyRobot::Position do

  let(:x_coord) { 0 }
  let(:y_coord) { 0 }
  let(:cardinal) { 'WEST' }

  let(:position) {ToyRobot::Factory.create_position(x_coord, y_coord, cardinal)}

  subject { position }


  context '#change_cardinal_direction' do
    it 'rotates the cardinal direction 90 left and right' do
      subject.change_cardinal_direction(:left)
      expect(subject.cardinal_direction).to eql(:SOUTH)

      subject.change_cardinal_direction(:right)
      expect(subject.cardinal_direction).to eql(cardinal.to_sym)

      subject.change_cardinal_direction(:right)
      subject.change_cardinal_direction(:right)
      subject.change_cardinal_direction(:right)
      subject.change_cardinal_direction(:left)
      expect(subject.cardinal_direction).to eql(:EAST)
    end
  end

  context '#to_s' do
    it 'should return a string announcing  X,Y and cardinal of the robot' do
      expect(subject.to_s
      ).to eql("#{position.coords.join(',')} #{cardinal}")
    end
  end

  context '#==' do
    it 'should be able to compare different positions' do
      pos1 = ToyRobot::Position.new(0, 2, 'EAST')
      pos2 = ToyRobot::Position.new(0, 0, 'WEST')

      expect(pos1.==(subject)).to be false
      expect(pos2.==(subject)).to be true
    end
  end

  context '#advance_position' do
    it 'expects coordinates to increase as position advance' do
      pos = subject.advance_position
      expect(pos.x_coord).to eql(x_coord - 1)
      expect(pos.y_coord).to eql(y_coord)

      position.change_cardinal_direction(:right)

      pos2 = subject.advance_position
      expect(pos2.x_coord).to eql(x_coord)
      expect(pos2.y_coord).to eql(y_coord + 1)
    end
  end
end

