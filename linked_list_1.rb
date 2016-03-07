class LinkedListNode
  attr_accessor :value, :next_node
 
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else      
    print "nil\n"
    return
  end
end

class Stack
  attr_reader :data

  def initialize
    @data = nil
  end

  def push(value)
    if @data == nil
      @data = LinkedListNode.new(value)
    else
      new_node = LinkedListNode.new(value, @data)
      @data = new_node
    end
    return self  
  end

  def pop
    return_value = @data.value
    @data = @data.next_node
    return return_value
  end

  def empty?
    return @data == nil ? true : false
  end
end

def reverse_list(list)
  reversal_stack = Stack.new

  while list
    reversal_stack.push(list)  
    list = list.next_node
  end

  list_pointer = new_list = reversal_stack.pop
  until reversal_stack.empty?
    added_node = reversal_stack.pop
    list_pointer.next_node = added_node
    list_pointer = added_node
  end
  list_pointer.next_node = nil # Make sure the new list has a proper tail
  
  return new_list
end