require 'set'

def readInput(file)
  file = File.open(file).readlines.map { |row| row.chomp.split('').map(&:to_i) }
end

def iterateThroughMap(map)
  visited = Set[]
  basinList = []
  map.length.times do |row|
    map[row].length.times do |col|
      if !visited.include?([row, col]) && map[row][col] != 9 
        visited.add([row, col])
        basinSize = traverseBasin(row, col, visited, map)
        basinList = addToBasin(basinSize, basinList)
      end
    end
  end
  basinList
end

def traverseBasin(row, col, visited, map)
  queue = Queue.new
  queue << [row, col]
  count = 0

  while queue.length > 0
    i, j = queue.deq
    count += 1

    if i > 0 && map[i-1][j] != 9 && !visited.include?([i-1,j])
      visited << [i-1, j]
      queue << [i-1, j]
    end

    if i < map.length - 1 && map[i+1][j] != 9 && !visited.include?([i+1,j])
      visited << [i+1, j]
      queue << [i+1, j]
    end

    if j > 0 && map[i][j-1] != 9 && !visited.include?([i,j-1])
      visited << [i, j-1]
      queue << [i, j-1]
    end

    if j < map[0].length - 1 && map[i][j+1] != 9 && !visited.include?([i,j+1])
      visited << [i, j+1]
      queue << [i, j+1]
    end

  end
  count
end
# start basin search unless index in visited

def addToBasin(basin, basinList)
  if basinList.length < 3
    basinList << basin 
  else
    min = basinList.min
    if basin > min
      basinList.delete(min)
      basinList << basin
    end
  end
  basinList
end

 file = readInput('input')
 print iterateThroughMap(file).reduce(1, :*)

# a= ['2199943210',
# '3987894921',
# '9856789892',
# '8767896789',
# '9899965678']
# a = a.map{|row| row.split('').map(&:to_i)}
# print a

# puts
#  print iterateThroughMap(a).reduce(1, :*)