# load 'searching_binary_trees.rb'

class Node
  attr_accessor :value, :parent, :lchild, :rchild
  
  def initialize(value)
    @value = value
  end
  
  def lchild=(lchild) # !> method redefined; discarding old lchild=
    if lchild.is_a?(Node)
      @lchild = lchild
      lchild.parent = self
    end
  end
  
  def rchild=(rchild) # !> method redefined; discarding old rchild=
    if rchild.is_a?(Node)
      @rchild = rchild
      rchild.parent = self
    end
  end
  
  def leaf?
    ! (@lchild || @rchild)
  end
  
  def self.all
    ObjectSpace.each_object(self).to_a
  end
  
  def self.root
    ObjectSpace.each_object(self) { |node| return node if node.parent == nil }
  end
end

def build_tree(array)
  root = Node.new(array.shift)
  array.each do |value|
    current = root
    loop do
      if value >= current.value && !current.rchild
        new = Node.new(value)
        current.rchild = new
        break
      elsif value <= current.value && !current.lchild
        new = Node.new(value)
        current.lchild = new
        break
      else
        if value >= current.value
          current = current.rchild
        elsif value <= current.value
          current = current.lchild
        end
        next
      end
    end    
  end
end

def breadth_first_search(target)
  queue = []
  current = Node.root
  loop do    
    return current if current.value == target
    queue << current.lchild if current.lchild
    queue << current.rchild if current.rchild
    return nil if queue.empty?
    current = queue.shift
    next
  end
end

def depth_first_search(target)
  stack = []
  visited = []
  current = Node.root
  stack << current
  loop do
    return current if current.value == target
    visited << current
    if (current.lchild && !(visited.include?(current.lchild)))
      stack << current.lchild
      current = current.lchild
    elsif (current.rchild && !(visited.include?(current.rchild)))
      stack << current.rchild
      current = current.rchild
    else
      return nil if stack.empty?
      current = stack.pop
    end
    next
  end
end

def dfs_rec(target, current = Node.root)
  return current if current.value == target
  dfs_rec(target, current.lchild) if current.lchild
  dfs_rec(target, current.rchild) if current.rchild
end

array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
build_tree(array)
root = Node.root # !> assigned but unused variable - root
breadth_first_search(444) # => nil
breadth_first_search(67).value # => 67
breadth_first_search(67).object_id # => 70363472368660
depth_first_search(444) # => nil
depth_first_search(67).value # => 67
depth_first_search(67).object_id # => 70363472368660
dfs_rec(444) # => nil
dfs_rec(67).value # => 67
dfs_rec(67).object_id # => 70363472368660





