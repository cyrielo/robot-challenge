RSpec.shared_examples "an Application" do

  specify "properties" do
    should respond_to(:args)
    should respond_to(:command)
    should respond_to(:toy_robot)
  end

  specify "method" do
    should respond_to(:version)
    should respond_to(:run).with(1).argument
    should respond_to(:help_prompt)
  end
end

