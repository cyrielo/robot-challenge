RSpec.shared_examples "a TableTop" do

  specify "properties" do
    should respond_to(:left)
    should respond_to(:bottom)
    should respond_to(:right)
    should respond_to(:top)
  end

  specify "method" do
    should respond_to(:is_within_bounds).with(2).argument
  end
end

