crab_list = File.read("input").split(",").map {|crab| 
  crab.chomp
  crab.to_i
}


sorted_list = crab_list.sort

def find_median(list)
  mid = ((list.length-1)/2.0).floor
end

median = sorted_list[find_median(sorted_list)]

def calc_fuel (array, median)
  fuel = 0
  array.each do |pos|
    fuel += (median - pos).abs
  end
  fuel
end

puts calc_fuel(sorted_list, median)

## PART 2

def find_mean(list)
  sum = 0
  list.each do |num|
    sum += num
  end
  sum/list.length
end

mean = find_mean(crab_list)

def calc_fuel2 (array, mean)
  fuel = 0
  array.each do |pos|
    diff = (mean - pos).abs
    diff.times do |i|
      fuel += i + 1
    end
  end
  fuel
end

puts calc_fuel2(sorted_list, mean)
