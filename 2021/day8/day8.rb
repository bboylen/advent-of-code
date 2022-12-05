require 'set'

inputs = File.open('input.txt').readlines.map(&:chomp).map {|line| line.split(' | ')}

outputs = inputs.map {|line| line[1].split(' ')}

count = 0
digits = [2, 3, 4, 7].to_set

outputs.each do |output|
  output.each do |code|
    puts code
    if digits.include?(code.length)
      count += 1
    end
  end
end
puts count