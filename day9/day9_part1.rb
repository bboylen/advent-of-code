def readInput(file)
  file = File.open(file).readlines.map { |row| row.chomp.split('').map(&:to_i) }
end

def iterateThroughMap(map)
  risk = 0
  map.length.times do |row|
    map[row].length.times do |col|
      lowPoint = checkLowPoint(map, map[row][col], row, col)
      if lowPoint
        risk += map[row][col] + 1
      end
    end
  end
  risk
end

def checkLowPoint(map, point, row, col)
  isLowPoint = true

  isLowPoint = map[row - 1][col] > point if row != 0

  isLowPoint = map[row + 1][col] > point if (row != map.length - 1) && isLowPoint

  isLowPoint = map[row][col - 1] > point if (col != 0) && isLowPoint

  isLowPoint = map[row][col + 1] > point if (col != map[0].length - 1) && isLowPoint

  isLowPoint
end

file = readInput('input')
print iterateThroughMap(file)
