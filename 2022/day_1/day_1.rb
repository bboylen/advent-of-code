require 'debug'

def main(input)
  food_groups = File.open(input).readlines.map(&:chomp)
  max = 0
  curr = 0
  food_groups.each do |food|
    if food.empty?
      curr = 0
    else
      curr += food.to_i
      max = [max, curr].max
    end
  end
  max
end

print main('input.txt')

def main2(input)
  food_groups = File.open(input).readlines.map(&:chomp)
  arr = []
  curr = 0
  food_groups.each do |food|
    if food.empty?
      arr << curr
      curr = 0
    else
      curr += food.to_i
    end
  end
  arr.sort.last(3).sum
end
puts
print main2('input.txt')
