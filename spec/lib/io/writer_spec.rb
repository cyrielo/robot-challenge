require_relative '../../app/lib/io/writer'

RSpec.describe ToyRobot::Reader do

  context 'behave like a file reader' do
    before(:example) do
      @reader = ToyRobot::Reader.new
    end

    it 'should have lines' do
      expect(@reader).to have_attributes(:lines)
    end
    it 'should have readline' do
      expect(reader).to respond_to(:readline).with(1..2).arguments
    end
  end

  context '#file' do
    it 'should actually readlines' do
      path = '/Users/cyrielo/projects/robot-challenge/spec/test_data/oneline.txt';
      @reader = reader.file(path)
      expect(reader.lines).to eql('oneliner')
    end
  end
end

