require_relative '../../app/factory/robot_factory'

RSpec.describe ToyRobot::Cli do
 
  before(:example) do
    @cli = ToyRobot::Factory.create_cli
  end

  context 'when an isntance of cli app is created' do
    #:application, :options, :reader, :writer
    it 'should have an application' do
      expect(@cli.application).to be_a_kind_of(ToyRobot::Application)
    end
    it 'should have a reader stream' do
      expect(@cli.reader).to be_a_kind_of(ToyRobot::Reader)
    end
    it 'should have a writer stream' do
      expect(@cli.writer).to be_a_kind_of(ToyRobot::Writer)
    end
    it 'should have empty options object' do
      expect(@cli).to have_attributes(:options => {})
    end

    it 'should have start' do
      expect(@cli).to respond_to(:start)
    end
    it 'should have prompt' do
      expect(@cli).to respond_to(:prompt)
    end
    it 'should have use_options' do
      expect(@cli).to respond_to(:use_options)
    end
  end
end
