input = File.open("input")
input_data = input.readlines.map(&:chomp)

end_points = input_data.map {|line| line.split(" -> ").map {|coordinates| coordinates.split(',').map {|coord| coord.to_i}}}

def is_straight (line)
  x1 = line[0][0]
  y1 = line[0][1]
  x2 = line[1][0]
  y2 = line[1][1]

  if x1 == x2 or y1 == y2
    true
  else 
    false
  end
end

straight_lines = end_points.filter(&->(line) {is_straight(line)})

def count_collisions(straight_lines)
  collisions = Array.new(1000) {Array.new(1000)}
  collision_count = 0
  straight_lines.each do |line|
    fixed = nil
    if line[0][0] == line[1][0]
      fixed = 0
    else
      fixed = 1
    end

    varying = fixed == 1 ? 0 : 1
    
    max = [line[0][varying], line[1][varying]].max
    min = [line[0][varying], line[1][varying]].min

    fixed_num = line[0][fixed]

    for coord in min..max do
      first_num = fixed == 1 ? coord : fixed_num
      second_num = fixed == 1 ? fixed_num : coord
      
      if !collisions[first_num][second_num]
        collisions[first_num][second_num] = 1
      elsif collisions[first_num][second_num] == 1
        collisions[first_num][second_num] += 1
        collision_count +=1
      else
        collisions[first_num][second_num] += 1
      end
    end
  end
  collision_count
end

puts count_collisions(straight_lines)