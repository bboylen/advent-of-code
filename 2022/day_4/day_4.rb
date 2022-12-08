require 'debug'

input = File.open('input.txt').readlines.map { |line| line.chomp.split(',').map { |pair| pair.split('-').map(&:to_i) } }

contained_count = 0

# debugger

input.each do |pair|
  if (pair[0][0] <= pair[1][0] && pair[0][1] >= pair[1][1]) ||
     (pair[1][0] <= pair[0][0] && pair[1][1] >= pair[0][1])
    contained_count += 1
  end
end

puts contained_count

pair_count = 0

input.each do |pair|
  if (pair[0][1] >= pair[1][0] && pair[0][1] <= pair[1][1]) ||
     (pair[1][1] >= pair[0][0] && pair[1][1] <= pair[0][1])
    pair_count += 1
  end
end

puts pair_count
