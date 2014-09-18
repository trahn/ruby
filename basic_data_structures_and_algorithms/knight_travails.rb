$board = []
8.times do |i|
  8.times do |j|
    $board << [i,j]
  end
end


def moves(position)
  moves = []
  steps = [[2,-2], [1,-1]]
  steps[0].each do |i|
    steps[1].each do |j|
      moves << [position[0]+i, position[1]+j]
      moves << [position[0]+j, position[1]+i]
    end
  end
  moves.select { |move| $board.include?(move) }
end

moves([0,0]) # => [[2, 1], [1, 2]]

class Node
  
  attr_accessor :position, :parent
  attr_reader :children
  
  def initialize(position, parent = nil)
    @position = position
    @parent = parent
    @children = []
  end
  
  def children=(pos)
    new_child = Node.new(pos, self)
    @children << new_child
  end
  
end

def build_tree(start_pos, end_pos)
  root = Node.new(start_pos)
  return root if root.position == end_pos
  currents = [root]
  found = false
  until found
    currents.each do |current|
      moves(current.position).each do |move|
        current.children << Node.new(move, current)
        found = true if move == end_pos
        break if found
      end
      break if found 
    end
    currents = currents.inject([]) { |array, e| array + e.children }
  end
  root
end

root = build_tree([0,0],[1,2]) # => #<Node:0x007ffe309e8ca8 @position=[0, 0], @parent=nil, @children=[#<Node:0x007ffe309e8a28 @position=[2, 1], @parent=#<Node:0x007ffe309e8ca8 ...>, @children=[]>, #<Node:0x007ffe309e89d8 @position=[1, 2], @parent=#<Node:0x007ffe309e8ca8 ...>, @children=[]>]>

def dfs_rec(end_pos, current)
  return current if current.position == end_pos
  end_node = current.children.collect do |child|
    dfs_rec(end_pos, child)
  end
  end_node.flatten
end

dfs_rec([1,2], root).first # => #<Node:0x007ffe309e89d8 @position=[1, 2], @parent=#<Node:0x007ffe309e8ca8 @position=[0, 0], @parent=nil, @children=[#<Node:0x007ffe309e8a28 @position=[2, 1], @parent=#<Node:0x007ffe309e8ca8 ...>, @children=[]>, #<Node:0x007ffe309e89d8 ...>]>, @children=[]>

def knight_moves(start_pos, end_pos)
  root = build_tree(start_pos, end_pos)
  current = dfs_rec(end_pos, root).first
  result = []
  while current
    result << current.position 
    current = current.parent
  end
  puts "You made it in #{result.length-1} moves! Here's your path:"
  result.length.times { puts result.pop.to_s }
end

#knight_moves([0,0],[1,2])
#knight_moves([0,0],[3,3]) 
knight_moves([3,3],[4,3])


# >> You made it in 3 moves! Here's your path:
# >> [3, 3]
# >> [5, 4]
# >> [3, 5]
# >> [4, 3]
