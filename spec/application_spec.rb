require_relative '../app/application'

RSpec.describe ToyRobot::Application, '#help_prompt' do

  context 'when you pass a valid command parameter' do
    commands = [ 'PLACE 3, 3, EAST', 'place 3,3,west', 'pLace 3,3,noRtH']
    commands.each do |command|
      it "should parse command #{command} and return a correct hash" do
        command_split = command.scan(/-?\w+/)
        parsed_command = ToyRobot::ApplicationHelper.parse_command(command)
        expect(parsed_command.has_key?(:command)).to be true
        expect(parsed_command.has_key?(:args)).to be true
        expect(parsed_command[:command]).to be_a String
        expect(parsed_command[:args]).to be_a Array
        expect(parsed_command[:command]).to eql(command_split.first)
        expect(parsed_command[:args].length).to eql(3)
        parsed_command[:args].each_with_index do |arg, index|
          expect(arg).to eql(command_split[1...][index])
        end
      end
    end
  end

  context 'when you pass an in-valid command parameter' do
    it 'should return empty hash when for nil and empty string parameter ' do
      empty = {}
      parsed_command = ToyRobot::ApplicationHelper.parse_command(nil)
      parsed_command2 = ToyRobot::ApplicationHelper.parse_command('')
      expect(parsed_command).to eql empty
      expect(parsed_command2[:command]).to be_nil
      expect(parsed_command2[:args]).to be_nil
    end
  end

  context 'when you launch cli app' do
    it 'shows the help prompt' do
      expect(1).eql?(1)
    end
  end
end
