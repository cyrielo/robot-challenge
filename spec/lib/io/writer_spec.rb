require_relative '../../../app/lib/io/writer'

RSpec.describe ToyRobot::Writer do

  context 'behave like a file writer' do
    before(:example) do
      @writer = ToyRobot::Writer.new
    end

    it 'should have path' do
      expect(@writer).to have_attributes(:path => nil)
    end

    it 'should have write method' do
      expect(@writer).to respond_to(:write).with(1..2).arguments
    end

    it 'should have writeln method' do
      expect(@writer).to respond_to(:writeln).with(1).arguments
    end
  end

  context '#file' do
    it 'should actually write to file' do
      path = File.join(Dir.pwd,'spec/test_data/asdf.txt')
      msg = 'qwertyuiop'
      writer = ToyRobot::Writer.new
      writer = writer.file(path)
      writer.write(msg)
      lines = File.readlines(path, chomp: true).join('')
      expect(lines).to eql(msg)
      File.delete(path)
    end
  end
end

