file = File.open("input")
data = file.readlines.map(&:chomp)
file.close
lines = []
data.each do |l|
  pts = l.split(" -> ")
  l = pts.first.split(",")
  left = {x: l.first.to_i, y: l.last.to_i}
  r = pts.last.split(",")
  right = {x: r.first.to_i, y: r.last.to_i}
  lines.push([left, right])
end
coords = {}
def mark(coords, x, y)
  coords[[x, y]] = coords.fetch([x, y], 0) + 1
end
lines.each do |line|
  x1 = line.first[:x]
  y1 = line.first[:y]
  x2 = line.last[:x]
  y2 = line.last[:y]
  if x1 == x2
    ([y1, y2].min..[y1, y2].max).step(1) do |i|
      mark(coords, x1, i)
    end
  elsif y1 == y2
    ([x1, x2].min..[x1, x2].max).step(1) do |i|
      mark(coords, i, y1)
    end
  end
end
pp coords.values.count { |x| x > 1 }