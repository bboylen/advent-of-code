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
  results = []
  draws.each do |x|
    boards.each_with_index do |b, bi|
      b.each do |r|
        r.each_with_index do |c, i|
          if x == c[:d]
            c[:m] = true
            if b.map(&->(rr) { rr[i] }).all? { |cc| cc[:m] == true } || r.all? { |rr| rr[:m] == true }
              sum = 0
              boards[bi].each do |r|
                r.each do |c|
                  if c[:m] == false
                    sum += c[:d]
                  end
                end
              end
              results.push({board_idx: bi, draw: x, unmarked_sum: sum})
            end
          end
        end
      end
    end
  end
  results
end

board_firsts = []
seen = Set[]
runBingo(draws, boards).each do |r|
  if !seen.include?(r[:board_idx])
    seen.add(r[:board_idx])
    board_firsts.push(r)
  end
end
# part one
pp board_firsts.first[:draw] * board_firsts.first[:unmarked_sum]
# part one
pp board_firsts.last[:draw] * board_firsts.last[:unmarked_sum]