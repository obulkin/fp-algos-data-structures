require_relative "../tree_traversal.rb"

# Build tree used for testing
deep_fifth_node = TreeNode.new(5, [])
eleventh_node = TreeNode.new(11, [])
fourth_node = TreeNode.new(4, [])
ninth_node = TreeNode.new(9, [fourth_node])
sixth_node = TreeNode.new(6, [deep_fifth_node, eleventh_node])
seventh_node = TreeNode.new(7, [sixth_node])
shallow_fifth_node = TreeNode.new(5, [ninth_node])
trunk = TreeNode.new(2, [seventh_node, shallow_fifth_node])

# Run benchmark before starting tests
require "benchmark"
num = 11
Benchmark.bm do |x|
  x.report("depth_first_search") do
    100_000.times {depth_first_search num, trunk}
  end
  x.report("depth_first_search_iterative") do
    100_000.times {depth_first_search_iterative num, trunk}
  end

  x.report("breadth_first_search") do
    100_000.times {breadth_first_search num, trunk}
  end
end

RSpec.describe "#depth_first_search" do
  it "should find the node that corresponds to the given payload and reflects the search tactic used" do
    expect(depth_first_search(11, trunk)).to eq(eleventh_node)
    expect(depth_first_search(5, trunk)).to eq(deep_fifth_node)
  end

  it "should return false when the given payload cannot be found" do
    expect(depth_first_search(23, trunk)).to eq(false)
  end
end

RSpec.describe "#depth_first_search_iterative" do
  it "should find the node that corresponds to the given payload and reflects the search tactic used" do
    expect(depth_first_search_iterative(11, trunk)).to eq(eleventh_node)
    expect(depth_first_search_iterative(5, trunk)).to eq(deep_fifth_node)
  end

  it "should return false when the given payload cannot be found" do
    expect(depth_first_search_iterative(23, trunk)).to eq(false)
  end
end

RSpec.describe "#breadth_first_search" do
  it "should find the node that corresponds to the given payload and reflects the search tactic used" do
    expect(breadth_first_search(11, trunk)).to eq(eleventh_node)
    expect(breadth_first_search(5, trunk)).to eq(shallow_fifth_node)
  end

  it "should return false when the given payload cannot be found" do
    expect(breadth_first_search(23, trunk)).to eq(false)
  end
end
