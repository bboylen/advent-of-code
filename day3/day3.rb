count_array = []
File.foreach("input") do |code|
    pos = 0
    code_array = code.chomp.split('')
    code_array.each do |char|
      if char == "0"
        count_array[pos] != nil ? count_array[pos] -= 1 : count_array[pos] = -1
      else
        count_array[pos] != nil ? count_array[pos] += 1 : count_array[pos] = 1
      end
      pos += 1
    end
end

gamma = ""
count_array.each {|place| 
  if place < 0 
    gamma += "0"
  else
    gamma += "1"
  end
}

puts gamma


def convert(binary_string) 
  base = 1
  sum = 0
  binary_string.split('').reverse_each do |bit|
    sum += bit.to_i * base
    base *= 2 
  end
  sum
end



def inverse(binary_string)
  inverted_array = []
  binary_string.split('').each {|bit| 
    if bit == "0"
      inverted_array << 1
    else 
      inverted_array << 0
    end
  }
  print inverted_array
  inverted_array.join
end

gamma_num = convert(gamma)
epsilon_num = convert(inverse(gamma))

puts gamma_num
puts epsilon_num

puts gamma_num * epsilon_num


# Part 2

def generate_rating(main, side) 
  
  nums = File.read("input").split
  length = nums[0].length
  length.times do |i|
    main_array = []
    side_array = []
    main_count = 0
    side_count = 0

    nums.each do |code|
      if code[i] == main
        main_array << code
        main_count += 1
      else
        side_array << code
        side_count += 1
      end
    end
    # print main_array
    if main_count >= side_count 
      nums = main_array
    else
      nums = side_array
    end
    # puts nums, i
    if nums.length == 1 then return nums[0]
  end
end
end

def generate_rating2(main, side) 
  
  nums = File.read("input").split
  length = nums[0].length
  length.times do |i|
    main_array = []
    side_array = []
    main_count = 0
    side_count = 0

    nums.each do |code|
      if code[i] == main
        main_array << code
        main_count += 1
      else
        side_array << code
        side_count += 1
      end
    end
    # print main_array
    if main_count <= side_count 
      nums = main_array
    else
      nums = side_array
    end
    # puts nums, i
    if nums.length == 1 then return nums[0]
  end
end
end

oxygen = convert(generate_rating("1","0"))
co2 =  convert(generate_rating2("0","1"))

puts oxygen, co2

puts oxygen * co2