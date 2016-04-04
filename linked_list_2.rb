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

def reverse_list(list)
  next_entity = list.next_node
  list.next_node = nil # Make sure new list has proper tail
  until next_entity == nil 
    previous_entity = list
    list = next_entity
    next_entity = list.next_node
    list.next_node = previous_entity
  end
  return list
end

def is_list_infinite?(list)
  return false if list.next_node == nil || list.next_node.next_node == nil # Handles finite lists with one or two elements
  slow_pointer = list.next_node
  fast_pointer = list.next_node.next_node
  while slow_pointer != fast_pointer
    return false if fast_pointer.next_node == nil || fast_pointer.next_node.next_node == nil # The list has ended
    slow_pointer = slow_pointer.next_node
    fast_pointer = fast_pointer.next_node.next_node
  end
  true
end