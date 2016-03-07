require_relative "../linked_list_1.rb"

RSpec.describe Stack do
  describe "#initialize" do
    it "will create a stack with a nil data variable" do
      expect(Stack.new.data).to eq(nil)
    end
  end

  describe "#push" do
    it "will add an element to the top of the stack and do so without disturbing existing stack content" do
      expect(Stack.new.push(5).data.value).to eq(5)
      expect(Stack.new.push(5).push("hello").data.next_node.value).to eq(5)
    end
  end

  describe "#pop" do
    it "will return the top element in the stack" do
      expect(Stack.new.push([4, 6]).push("woah").pop).to eq("woah")
    end
    it "will remove the element that it returns from the stack" do
      test_stack = Stack.new.push([4, 6])
      test_stack.pop
      expect(test_stack.data).to eq(nil)
      test_stack.push("word").push(false).pop
      expect(test_stack.data.value).to eq("word")
    end
  end

  describe "empty?" do
    it "will return true for empty stacks and false for ones that have elements" do
      expect(Stack.new.empty?).to eq(true)
      expect(Stack.new.push(5).empty?).to eq(false)
    end
  end
end

RSpec.describe "#reverse_list" do
  it "will reverse a list" do
    node1 = LinkedListNode.new(37)
    node2 = LinkedListNode.new(99, node1)
    node3 = LinkedListNode.new(12, node2)
    expect {print_values(reverse_list(node3))}.to output("37 --> 99 --> 12 --> nil\n").to_stdout
  end
end