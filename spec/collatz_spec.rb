require_relative "../collatz.rb"

RSpec.describe "#collatz" do
  {1 => [1], 2 => [2, 1], 3 => [3, 10, 5, 16, 8, 4, 2, 1], 4 => [4, 2, 1], 5 => [5, 16, 8, 4, 2, 1], 6 => [6, 3, 10, 5, 16, 8, 4, 2, 1], 7 => [7, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]}. each do |starting_point, sequence|
    it "should return the right sequence for a starting point of #{starting_point}" do
      expect(collatz starting_point).to eq(sequence)
    end
  end
end

RSpec.describe "#longest_collatz" do
  it "should return the starting point that produces the longest Collatz sequence while falling into a given range" do
    expect(longest_collatz 1..7).to eq(7)
    expect(longest_collatz 1..1000000).to eq(837799)
  end
end