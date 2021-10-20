RSpec.shared_examples "a Robot" do

  specify "properties" do
    should respond_to(:table_top)
    should respond_to(:position)
  end

  specify "method" do
    should respond_to(:place).with(3).argument
    should respond_to(:report)
    should respond_to(:move)
    should respond_to(:left)
    should respond_to(:right)
  end
end
