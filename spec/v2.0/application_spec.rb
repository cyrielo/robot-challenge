require_relative '../../app/factory/robot_factory'
require_relative '../shared_examples/an_application'

RSpec.describe 'ToyRobot2::Application' do
  let(:application) { ToyRobot::Factory.create_application_v2 }

  subject { application }

  it_should_behave_like 'an Application'
end
