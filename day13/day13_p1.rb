def parse_input(input)
  lines = File.open(input).readlines.map(&:chomp)
  split = lines.find_index('')
  coords = lines[0..split - 1].map {|coords| coords.split(',').map(&:to_i)}
  instructions = lines[split + 1..-1]
  print coords
  puts
  print instructions
end

def main(input)
  parse_input(input)
end

main('input')
