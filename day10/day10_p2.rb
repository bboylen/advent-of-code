def read_input(input)
  File.open(input).readlines.map do |line|
    line.chomp
  end
end

def iterate_lines(input)
  corrupted = []
  input.each do |line|
    corrupted << find_corrupted(line)
  end
  corrupted
end

def find_corrupted(line)
  closing_syntax = { ']' => '[', '>' => '<', ')' => '(', '}' => '{' }
  stack = []

  line.each_char do |char|
    if closing_syntax.include?(char)
      if stack.last && stack.last == closing_syntax[char]
        stack.pop
      else
        return char
      end
    else
      stack << char
    end
  end
  nil
end

def main(input)
  points = { ']' => 57, '>' => 25_137, ')' => 3, '}' => 1197 }

  lines = read_input(input)
  corrupted = iterate_lines(lines)
  print corrupted.filter { |char| !char.nil? }.reduce(0) { |sum, char| sum + points[char] }
end

main('input')