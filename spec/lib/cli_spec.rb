require_relative '../../app/factory/robot_factory'

RSpec.describe ToyRobot::Cli do
  let(:cli) { ToyRobot::Factory.create_cli }
  subject { cli }

  context 'when an isntance of cli app is created' do
    # :application, :options, :reader, :writer
    it 'should have an application' do
      expect(subject.application).to be_a_kind_of(ToyRobot::Application)
    end
    it 'should have a reader stream' do
      expect(subject.reader).to be_a_kind_of(ToyRobot::Reader)
    end
    it 'should have a writer stream' do
      expect(subject.writer).to be_a_kind_of(ToyRobot::Writer)
    end
    it 'should have empty options object' do
      expect(subject).to have_attributes(options: {})
    end

    it 'should have start' do
      expect(subject).to respond_to(:start)
    end
    it 'should have prompt' do
      expect(subject).to respond_to(:prompt)
    end
    it 'should have use_options' do
      expect(subject).to respond_to(:use_options)
    end
  end
end
