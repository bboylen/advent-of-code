def read_input(input)
  File.open(input).readlines.map do |line|
    line.chomp
  end
end

def iterate_lines(input)
  not_corrupted = []
  input.each do |line|
    not_corrupted << line if !find_corrupted(line)
  end
  not_corrupted
end

def find_corrupted(line)
  closing_syntax = { ']' => '[', '>' => '<', ')' => '(', '}' => '{' }
  stack = []
  is_corrupted = false

  line.each_char do |char|
    if closing_syntax.include?(char)
      if stack.last && stack.last == closing_syntax[char]
        stack.pop
      else
        return true
      end
    else
      stack << char
    end
  end
  is_corrupted
end

def find_complete(line)
  closing_syntax = { ']' => '[', '>' => '<', ')' => '(', '}' => '{' }
  stack = []
  complete = []
  
  line.each_char do |char|
    if closing_syntax.include?(char)
      if stack.last && stack.last == closing_syntax[char]
        stack.pop
      else
        return true
      end
    else
      stack << char
    end
  end
  stack.reverse_each { |x| complete << closing_syntax.invert[x]}
  complete
end

def complete(lines)
  output = []
  lines.each do |line|
    output << find_complete(line)
  end
  output
end

def main(input)
  points = { ']' => 2, '>' => 4, ')' => 1, '}' => 3 }

  lines = read_input(input)
  not_corrupted = iterate_lines(lines)
  completion = complete(not_corrupted)
  print completion.map {|end_chars| end_chars.reduce(0) { |prod, char| prod * 5 + points[char] }}.sort[(completion.length-1)/2]
end

main('input')