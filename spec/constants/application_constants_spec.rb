require_relative '../../app/constants/application_constants'

RSpec.describe 'ToyRobot::ApplicationConstants' do
  context 'Application constants' do
    it 'ensures constants cannot be modified and are not empty' do
      expect(ToyRobot::VALID_COMMANDS).to be_a(Array)
      expect(ToyRobot::VALID_COMMANDS.frozen?).to eql(true)
      expect(ToyRobot::VALID_COMMANDS.length).to eql(7)

      expect(ToyRobot::CARDINALS).to be_a(Hash)
      expect(ToyRobot::CARDINALS.frozen?).to eql(true)
      expect(ToyRobot::CARDINALS.keys.length).to eql(4)
    end
  end
end
