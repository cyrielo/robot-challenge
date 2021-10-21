require_relative '../../../app/lib/io/reader'
RSpec.describe ToyRobot::Reader do

  context 'behave like a file reader' do
    before(:example) do
      @reader = ToyRobot::Reader.new
    end

    it 'should have lines' do
      expect(@reader).to have_attributes(:lines => nil)
    end

    it 'should have readline' do
      expect(@reader).to respond_to(:readline).with(1).arguments
    end
  end

  context '#file' do
    it 'should actually readlines' do
      path = '/Users/cyrielo/projects/robot-challenge/spec/test_data/oneline.txt'
      reader = ToyRobot::Reader.new
      reader = reader.file(path)
      expect(reader.lines.join('')).to eql('oneliner')
    end
  end
end

