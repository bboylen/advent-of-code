require 'debug'

def main(input)
  rucksacks = File.open(input).readlines.map(&:chomp)
  puts RucksackHandler.new(rucksacks).sum_priorities
  puts RucksackHandler.new(rucksacks).sum_badges
end

class RucksackHandler
  def initialize(rucksacks)
    @rucksacks = rucksacks
  end

  def sum_badges
    groups = split_into_three
    groups.map { |group| scan_for_duplicate_2(*group) }
          .map { |char| get_priority(char) }.sum
  end

  def sum_priorities
    @rucksacks.map { |rucksack| split_rucksack(rucksack) }
              .map { |rucksacks| scan_for_duplicate(*rucksacks) }
              .map { |char| get_priority(char) }.sum
  end

  def split_rucksack(rucksack)
    [
      rucksack[0..rucksack.length / 2 - 1],
      rucksack[rucksack.length / 2..-1]
    ]
  end

  def scan_for_duplicate(first, second)
    count = {}
    first.split('').each do |char|
      count[char] ||= 0
      count[char] += 1
    end
    count2 = {}
    second.split('').each do |char|
      count2[char] ||= 0
      count2[char] += 1
    end
    count.keys.each do |key|
      return key if count2[key]
    end
  end

  def get_priority(char)
    if char.ord > 96
      char.ord - 96
    else
      char.ord - 38
    end
  end

  def split_into_three
    arr = [[]]
    count = 0
    @rucksacks.each do |rucksack|
      arr[-1] << rucksack
      count += 1
      if count == 3
        count = 0
        arr << []
      end
    end
    arr.pop
    arr
  end

  def scan_for_duplicate_2(first, second, third)
    count = {}
    first.split('').each do |char|
      count[char] ||= 0
      count[char] += 1
    end
    count2 = {}
    second.split('').each do |char|
      count2[char] ||= 0
      count2[char] += 1
    end
    count3 = {}
    third.split('').each do |char|
      count3[char] ||= 0
      count3[char] += 1
    end
    count.keys.each do |key|
      return key if count2[key] && count3[key]
    end
  end
end

main('input.txt')
