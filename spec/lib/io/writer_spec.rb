require_relative '../../../app/factory/robot_factory'
RSpec.describe ToyRobot::Writer do
  let(:writer) { ToyRobot::Factory.create_writer }
  subject { writer }

  context 'behave like a file writer' do
    it 'should have path' do
      expect(subject).to have_attributes(path: nil)
    end

    it 'should have write method' do
      expect(subject).to respond_to(:write).with(1..2).arguments
    end

    it 'should have writeln method' do
      expect(subject).to respond_to(:writeln).with(1).arguments
    end
  end

  context '#file' do
    it 'should actually write to file' do
      path = File.join(Dir.pwd, 'spec/test_data/asdf.txt')
      msg = 'qwertyuiop'
      writer = ToyRobot::Factory.create_writer
      writer = writer.file(path)
      writer.write(msg)
      lines = File.readlines(path, chomp: true).join('')
      expect(lines).to eql(msg)
      File.delete(path)
    end
  end
end
