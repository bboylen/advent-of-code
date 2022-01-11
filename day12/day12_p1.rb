require 'set'

def parse_input(input)
  File.open(input).readlines.map { |line| line.chomp.split('-') }
end

## recursive backtracking
def start(paths)
  count = 0
  start_nodes = get_neighbors('start', paths)
  start_nodes.each do |node|
    visited = Set['start']
    if is_lower?(node)
      visited.add(node)
    end
    path = [node]
    count += traverse(node, paths, visited, path)
  end
  count
end

def traverse(node, paths, visited, path)
  count = 0

  if node == "end"
    return 1
  end
  print visited
  puts
  neighbors = get_neighbors(node, paths)
  valid = neighbors.filter { |adj| !visited.include?(adj) }
  valid.each do |next_node|
    if is_lower?(next_node[0])
      visited.add(next_node) 
    end
    path.push(next_node)
    count += traverse(next_node, paths, visited, path)
    path.pop
    visited.delete?(next_node)
  end
  count
end

def is_lower?(c)
  c >= 'a' && c <= 'z'
end

def get_neighbors(curr_node, paths)
  paths.filter { |path| path[0] == curr_node || path[1] == curr_node }.map do |path|
    path.filter do |node|
      node != curr_node
    end
  end.map { |node| node[0] }
end

def main(input)
  paths = parse_input(input)
  print start(paths)
end

main('input')
