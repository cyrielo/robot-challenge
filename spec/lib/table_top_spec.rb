require_relative '../../app/lib/table_top'

RSpec.describe ToyRobot::TableTop do

  before(:example) do
    @table_top = ToyRobot::TableTop.new
  end

  context 'when instantiated' do
    it 'should have default boundaries' do
      # :left_boundary, :right_boundary, :top_boundary, :bottom_boundary
      expect(@table_top.respond_to?(:left_boundary)).to eql(true)
      expect(@table_top.respond_to?(:right_boundary)).to eql(true)
      expect(@table_top.respond_to?(:top_boundary)).to eql(true)
      expect(@table_top.respond_to?(:bottom_boundary)).to eql(true)

      expect(@table_top.left_boundary).to eql(0)
      expect(@table_top.bottom_boundary).to eql(0)
      expect(@table_top.right_boundary).to eql(4)
      expect(@table_top.top_boundary).to eql(4)
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
