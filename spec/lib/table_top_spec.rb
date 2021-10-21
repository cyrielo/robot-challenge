require_relative '../../app/factory/robot_factory'

RSpec.describe ToyRobot::TableTop do

  let(:table_top) { ToyRobot::Factory.create_tabletop }
  subject { table_top }

  context 'when instantiated' do
    it 'should have default boundaries' do
      expect(subject.respond_to?(:left)).to eql(true)
      expect(subject.respond_to?(:right)).to eql(true)
      expect(subject.respond_to?(:top)).to eql(true)
      expect(subject.respond_to?(:bottom)).to eql(true)

      expect(subject.left).to eql(0)
      expect(subject.bottom).to eql(0)
      expect(subject.right).to eql(4)
      expect(subject.top).to eql(4)
    end
  end

  context "#is_within_bounds?" do
    it 'should be able to identify its perimeters' do
      is_within = subject.is_within_bounds?(0, 2)
      not_within = subject.is_within_bounds?(1, 5)
      expect(is_within).to eql(true)
      expect(not_within).to eql(false)
    end
  end
end
