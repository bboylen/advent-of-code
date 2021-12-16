crab_list = File.read("input").split(",").map {|crab| 
  crab.chomp
  crab.to_i
}


sorted_list = crab_list.sort
print sorted_list.length

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
puts calc_fuel(crab_list, median)