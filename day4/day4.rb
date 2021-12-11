require "csv"
require "set"

file = File.open("input")
data = file.readlines.map(&:chomp)
file.close

draws = CSV.parse(data[0]).first.map(&:to_i)
print data[1]
boards = data.drop(2).each_slice(6).to_a.map(
  &->(x) { x.delete_if(&:empty?).map(&->(r) { r.split.map(&->(c) { {d: c.to_i, m: false}})})}
)

def runBingo(draws, boards)
  
end