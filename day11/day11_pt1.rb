require 'set'

def read_input(input)
  File.open(input).readlines.map { |line| line.chomp.split('')}
end

def main(input)

end

def driver_func(input)
  flashes = 0
  100.times do 
    flash_result = run_flash(input)
    input = flash_result[0]
    flashes += flash_result[1]
  end
  flashes
end

def run_flash(input)
  visited = Set.new
end