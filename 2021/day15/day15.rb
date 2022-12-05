require 'set'

input = File.open('input').readlines.map { |line| line.chomp.split('').map(&:to_i) }
print input
visited = [0, 0].to_set
directions = [
  [-1, 0],
  [0, 1],
  [1, 0],
  [0, -1]
]
queue = [[[0,1], input[0][1]], [[1,0], input[1][0]]]

min_risk = []
ROWS = input.length
COLS = input[0].length
end = [ROWS -1, COLS -1]
while queue.length > 0 do 
  curr = queue.shift

  if curr[0] == end
    min_risk << curr[1]
  end

  directions.each do |dir|
    i = curr[0][0] + dir[0]
    j = curr[0][1] + dir[1]

    if i >= 0 && i < ROWS && j >= 0 && j < COLS
      #check visited/risk
    end
  end
end