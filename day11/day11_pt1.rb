require 'set'

def read_input(input)
  File.open(input).readlines.map { |line| line.chomp.split('').map(&:to_i) }
end

def main(input)
  input = read_input(input)
  print driver_func(input)
end

def driver_func(input)
  flashes = 0
  400.times do |i|
    flash_result = run_flashes(input)
    input = flash_result[0]
    puts i + 1 if flash_result[1] == 100
    flashes += flash_result[1]
  end
  flashes
end

def run_flashes(input)
  flashes = 0
  visited = Set.new
  input.each_with_index do |row, i|
    row.each_with_index do |_col, j|
      input[i][j] += 1
    end
  end

  directions = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
  queue = []
  input.each_with_index do |row, i|
    row.each_with_index do |_col, j|
      next unless !visited.include?([i, j]) && input[i][j] > 9

      visited.add([i, j])
      queue << [i, j]
      while queue.length > 0
        curr_i, curr_j = queue.shift

        input[curr_i][curr_j] = 0
        flashes += 1
        directions.each do |dir|
          new_i = curr_i + dir[0]
          new_j = curr_j + dir[1]
          next unless new_i >= 0 && new_i < input.length && new_j >= 0 && new_j < input[0].length && !visited.include?([new_i,
                                                                                                                        new_j])
          input[new_i][new_j] += 1
          if input[new_i][new_j] > 9
            visited.add([new_i, new_j])
            queue.push([new_i, new_j])
          end
        end
      end
    end
  end
  [input, flashes]
end

main('input')
