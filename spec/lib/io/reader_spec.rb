require_relative '../../../app/factory/robot_factory'
RSpec.describe ToyRobot::Reader do
  let(:reader) { ToyRobot::Factory.create_reader }
  subject { reader }

  context 'behave like a file reader' do
    it 'should have lines' do
      expect(subject).to have_attributes(lines: nil)
    end

    it 'should have readline' do
      expect(subject).to respond_to(:readline).with(1).arguments
    end
  end

  context '#file' do
    it 'should actually readlines' do
      path = '/Users/cyrielo/projects/robot-challenge/spec/test_data/oneline.txt'
      reader = ToyRobot::Factory.create_reader
      reader = reader.file(path)
      expect(reader.lines.join('')).to eql('oneliner')
    end
  end
end
