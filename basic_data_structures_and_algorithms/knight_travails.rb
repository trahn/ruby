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

class Node
  
  attr_accessor :position, :parent, :children
  
  def initialize(position)
    @position = position
    @children = []
  end
  
  def children=(pos) # !> method redefined; discarding old children=
    new_child = Node.new(pos)
    @children << new_child
    new_child.parent = self
  end
  
end

def build_tree(start_pos, end_pos)
  root = Node.new(start_pos)
  currents = [root]
  found = false
  until found
    currents.each do |current|
      moves(current.position).each do |move|
        current.children << Node.new(move)
        found = true && break if move == end_pos
      end
    end
    currents = currents.inject([]) { |array, e| array + e.children }
  end
  root
end

def knight_moves(start_pos, end_pos)
  return start_pos if start_pos == end_pos
  root = build_tree(start_pos, end_pos)
  
end

knight_moves([0,0],[1,2])
knight_moves([0,0],[3,3]) 
knight_moves([3,3],[0,0])

moves([3,3]) # => [[5, 4], [4, 5], [5, 2], [2, 5], [1, 4], [4, 1], [1, 2], [2, 1]]

$board # => [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7], [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7], [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [3, 7], [4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6], [4, 7], [5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6], [5, 7], [6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7], [7, 0], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6], [7, 7]]
