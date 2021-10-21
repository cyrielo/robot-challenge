require_relative '../app/factory/robot_factory'

RSpec.describe ToyRobot::Application, '#help_prompt' do

  before(:example) do
    @application = ToyRobot::Factory.create_application
  end

  context '#version' do
    it 'should have a version' do
      expect(@application.respond_to?(:version)).to be true
      expect(@application.version.frozen?).to be true
      expect(@application.version.is_a?(String)).to be true
    end
  end

  context '#help_prompt' do
    it 'should describe available commands' do
      expect(@application.help_prompt.is_a?(String)).to be true
    end
  end

  context 'when you pass a valid command parameter' do
    commands = [ 'PLACE 3, 3, EAST', 'place 3,3,west', 'pLace 3,3,noRtH']
    commands.each do |command|
      it "should parse command #{command} and return a correct hash" do
        command_split = command.scan(/-?\w+/)
        arg = command_split[1...]
        @application.run(command)
        report = @application.run('report').downcase
        expect( report ).to eql( "#{arg[0]},#{arg[1]} #{arg[2].downcase}" )
      end
    end
  end

  context 'when you pass an in-valid command parameter' do
    it 'should ignore invalid command' do
      @application.run('asdf')
      report = @application.run('report')
      expect(report).to be_nil
    end
  end
end
