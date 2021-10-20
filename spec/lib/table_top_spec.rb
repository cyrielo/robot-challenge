require_relative '../../app/factory/toy_robot'

RSpec.describe ToyRobot::TableTop do

  before(:example) do
    @table_top = ToyRobot::Factory.create_tabletop
  end

  context 'when instantiated' do
    it 'should have default boundaries' do
      expect(@table_top.respond_to?(:left)).to eql(true)
      expect(@table_top.respond_to?(:right)).to eql(true)
      expect(@table_top.respond_to?(:top)).to eql(true)
      expect(@table_top.respond_to?(:bottom)).to eql(true)

      expect(@table_top.left).to eql(0)
      expect(@table_top.bottom).to eql(0)
      expect(@table_top.right).to eql(4)
      expect(@table_top.top).to eql(4)
    end
  end

  context "#is_within_bounds?" do
    it 'should be able to identify its perimeters' do
      is_within = @table_top.is_within_bounds?(0, 2)
      not_within = @table_top.is_within_bounds?(1, 5)
      expect(is_within).to eql(true)
      expect(not_within).to eql(false)
    end
  end
end
