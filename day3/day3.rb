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