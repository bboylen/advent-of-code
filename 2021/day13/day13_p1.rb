def parse_input(input)
  lines = File.open(input).readlines.map(&:chomp)
  split = lines.find_index('')
  coords = lines[0..split - 1].map { |coords| coords.split(',').map(&:to_i) }
  instructions = lines[split + 1..-1].map { |instruction| instruction.match(/(x|y)=.*/)[0].split('=') }
  instructions.each { |instruction| instruction[1] = instruction[1].to_i }
  [coords, instructions]
end

def populate_grid(coords)
  x_length = coords.reduce(0) { |max, num| [max, num[0]].max }
  y_length = coords.reduce(0) { |max, num| [max, num[1]].max }
  arr = Array.new(y_length + 1, '.') { Array.new(x_length + 1, '.') }
  coords.each do |coord|
    arr[coord[1]][coord[0]] = '#'
  end
  arr
end

def count_periods(grid)
  puts grid.reduce(0) { |count, row| count + row.reduce(0) { |count_b, entry| entry == '#' ? count_b + 1 : count_b } }
end

def make_folds(grid, instructions)
  count = 0
  instructions.each do |instruction|
    count += 1
    if instruction[0] == "x"
      grid = vertical_fold(grid, instruction[1])
    else 
      grid = horizontal_fold(grid, instruction[1])
    end
    if count == 1
      count_periods(grid)
    end
  end  
  print grid
end

def horizontal_fold(grid, instruction)
  top_grid = grid[0..instruction - 1]
  bottom_grid = grid[instruction + 1..-1]
  bottom_grid.each_with_index do |row, row_i|
    row.length.times do |i|
      j = top_grid.length - 1 - row_i
      break if j < 0

      top_grid[j][i] = '#' if row[i] == '#'
    end
  end
  return_grid = top_grid
  if bottom_grid.length > top_grid.length
    extra = bottom_grid.length - top_grid.length
    extra_bottom_grid = bottom_grid[bottom_grid.length - extra..-1]
    return_grid = extra_bottom_grid + top_grid
  end
  return_grid
end

def vertical_fold(grid, instruction)
  left_grid = grid.map { |row| row[0..instruction - 1] }
  right_grid = grid.map { |row| row[instruction + 1..-1] }
  right_grid.each_with_index do |row, row_i|
    row.length.times do |i|
      j = left_grid[row_i].length - 1 - i
      break if j < 0

      left_grid[row_i][j] = '#' if row[i] == '#'
    end
  end
  return_grid = left_grid
  if right_grid[0].length > left_grid[0].length
    extra = right_grid[0].length - left_grid[0].length
    extra_right_grid = right_grid.map { |row| row[row.length - extra..-1] }
    return_grid = left_grid.map.with_index { |left_row, i| extra_right_grid[i] + left_row }
  end
  return_grid
end

def main(input)
  coords, instructions = parse_input(input)
  grid = populate_grid(coords)
  make_folds(grid, instructions)
end

main('input')
