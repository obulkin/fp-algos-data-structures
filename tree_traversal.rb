class TreeNode
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end
end

def depth_first_search(target, tree)
  if tree.payload == target
    tree
  elsif tree.children
    tree.children.each do |child|
      child_result = depth_first_search(target, child)
      return child_result if child_result
    end
    false
  else
    false
  end
end

def depth_first_search_iterative(target, tree)
  require "set"
  search_stack = [tree]
  visited_nodes = Set.new

  until search_stack.empty?
    # Check current node and note that
    current_node = search_stack.last
    return current_node if current_node.payload == target
    visited_nodes << current_node

    # Check the first child of the current node that hasn't been visited and remove the current node if all of its children have been visited
    unvisited_children = Set.new(current_node.children) - visited_nodes
    unvisited_children.empty? ? search_stack.pop : (search_stack << unvisited_children.first)
  end
  false
end

def breadth_first_search(target, tree)
  search_queue = [tree]
  until search_queue.empty?
    current_node = search_queue.shift
    return current_node if current_node.payload == target
    if current_node.children
      current_node.children.each do |child|
        search_queue << child
      end
    end
  end
  false
end
