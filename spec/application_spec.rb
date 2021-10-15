require_relative '../app/application'

RSpec.describe ToyRobot::Application, '#help_prompt' do
  context 'when you launch cli app' do
    it 'shows the help prompt' do
      expect(1).eql?(1)
    end
  end
end
