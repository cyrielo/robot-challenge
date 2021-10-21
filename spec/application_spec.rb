require_relative '../app/factory/robot_factory'
require_relative 'shared_examples/an_application'

RSpec.describe ToyRobot::Application, '#help_prompt' do


  let(:application) { ToyRobot::Factory.create_application }
  subject { application }
  it_should_behave_like "an Application"
  
end
