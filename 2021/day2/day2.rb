horizontal = 0
depth = 0
File.foreach("input") do |instruction|
  split_instruction = instruction.split
  if split_instruction[0] == "forward"
    horizontal += split_instruction[1].to_i
  elsif split_instruction[0] == "down"
    depth += split_instruction[1].to_i
  else 
    depth -= split_instruction[1].to_i
  end
end

puts horizontal * depth