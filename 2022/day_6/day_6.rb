require 'debug'
input = File.open('input.txt').readlines[0].chomp

def check(queue)
  hash = {}
  queue.each do |value|
    hash[value] ||= 0
    hash[value] += 1
  end
  return false if hash.values.any? { |v| v > 1 }

  true
end

# part 1
# queue = []
# (0..input.length).each do |i|
#   queue << input[i]

#   next unless queue.length == 4

#   start_found = check(queue)
#   if start_found
#     print i + 1
#     return
#   end
#   queue.shift
# end

queue = []
(0..input.length).each do |i|
  queue << input[i]

  next unless queue.length == 14

  start_found = check(queue)
  if start_found
    print i + 1
    return
  end
  queue.shift
end
