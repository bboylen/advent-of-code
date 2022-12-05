fish_list = File.read("input").split(",").map {|fish| 
  fish.chomp
  fish.to_i
}

80.times do |x|
  length = fish_list.length - 1
  for i in 0..length 
    if fish_list[i] == 0
      fish_list[i] = 6
      fish_list.append(8)
    else
      fish_list[i] -= 1
    end
  end
end

 puts fish_list.length

## PART 2

fish_list = File.read("input").split(",").map {|fish| 
  fish.chomp
  fish.to_i
}

fish_array = Array.new(9) {0}
fish_list.each {|age| fish_array[age] +=1 }
# print fish_array

256.times do 
  fish_array.rotate!
  fish_array[6] += fish_array[8]
end

puts fish_array.sum