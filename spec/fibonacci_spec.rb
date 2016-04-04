require_relative "../fibonacci.rb"

RSpec.describe "#recursive_fib" do
  {"0" => 0, "1" => 1, "2" => 1, "3" => 2, "4" => 3, "5" => 5, "6" => 8, "7" => 13, "8" => 21, "9" => 34}.each do |position, value|
    it "will correctly calculate the Fibonacci number in position #{position}" do
      expect(recursive_fib(position.to_i)).to eq(value)
    end
  end
end

RSpec.describe "#iterative_fib" do
  {"0" => 0, "1" => 1, "2" => 1, "3" => 2, "4" => 3, "5" => 5, "6" => 8, "7" => 13, "8" => 21, "9" => 34}.each do |position, value|
    it "will correctly calculate the Fibonacci number in position #{position}" do
      expect(iterative_fib(position.to_i)).to eq(value)
    end
  end
end