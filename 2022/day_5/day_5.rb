require 'debug'

input = File.open('input.txt').readlines.map(&:chomp)

crates = input[0..7]
commands = input[10..-1].map {|line| line.scan(/\d+/).map(&:to_i) }

stacks = Array.new(10) { [] }

(0..7).reverse_each do |i|
  j = 1
  while j <= 9
    crate_index = 4 * (j - 1) + 1
    value = crates[i][crate_index]
    stacks[j] << value unless value == ' '
    j += 1
  end
end

commands.each do |command|
  count, source, destination = command

  count.times do |i|
    crate = stacks[source].pop()
    stacks[destination] << crate
  end
end

print (stacks.map {|arr| arr[-1]}.join)