previous_measurement = nil
count = 0
File.foreach("input") do |depth|
  depth = depth.to_i
  if previous_measurement == nil
    previous_measurement = depth
  elsif previous_measurement < depth 
    count += 1
    previous_measurement = depth
  else
    previous_measurement = depth
  end
end
puts count
