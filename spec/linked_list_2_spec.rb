require_relative "../linked_list_2.rb"

RSpec.describe "#reverse_list" do
  it "will reverse a list" do
    node1 = LinkedListNode.new(37)
    node2 = LinkedListNode.new(99, node1)
    node3 = LinkedListNode.new(12, node2)
    expect {print_values(reverse_list(node3))}.to output("37 --> 99 --> 12 --> nil\n").to_stdout
  end
end

RSpec.describe "#is_list_infinite?" do
  it "will return true if a list has a loop, making it infinite, and false if it doesn't" do
    node1 = LinkedListNode.new(37)
    node2 = LinkedListNode.new(99, node1)
    node3 = LinkedListNode.new(12, node2)
    expect(is_list_infinite?(node1)).to eq(false)
    node1.next_node = node3
    expect(is_list_infinite?(node1)).to eq(true)
  end
  it "will properly handle lists of one or two elements" do
    node1 = LinkedListNode.new(37)
    expect(is_list_infinite?(node1)).to eq(false)
    node2 = LinkedListNode.new(99, node1)
    expect(is_list_infinite?(node2)).to eq(false)
  end
end