def parse_input(input)
  lines = File.open(input).readlines.map(&:chomp)
  split = lines.find_index('')
  coords = lines[0..split - 1].map {|coords| coords.split(',').map(&:to_i)}
  instructions = lines[split + 1..-1]
  # print instructions
  [coords, instructions]
end

def populate_grid (coords)
  x_length = coords.reduce(0) { |max, num| [max, num[0]].max}
  y_length = coords.reduce(0) { |max, num| [max, num[1]].max}
  arr = Array.new(y_length + 1, '.') {Array.new(x_length + 1, '.')}
  coords.each do |coord|
    arr[coord[1]][coord[0]] = '#'
  end
  arr
end

def count_periods (grid) 
  print grid.reduce(0) { |count, row| count + row.reduce(0) { |count_b, entry| entry == '.' ? count_b + 1 : count_b }}
end

def make_folds (grid, instructions)

end

def vertical_fold (grid, instruction)

end
def main(input)
  coords, instructions = parse_input(input)
  grid = populate_grid (coords)
  count_periods(grid)
end

main('input')
