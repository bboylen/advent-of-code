require 'debug'
def main(input)
  games = File.open(input).readlines.map { |line| line.chomp.split(' ') }
  ScoreCounter.new(games).count_total
end

class ScoreCounter
  def initialize(games)
    @games = games
    @shape_score = {
      'X' => 1,
      'Y' => 2,
      'Z' => 3
    }
    @letter_score = {
      'X' => 0,
      'Y' => 3,
      'Z' => 6
    }
  end

  def count_total
    total = 0
    @games.each do |game|
      total += count_game(game)
    end
    total
  end

  def count_total_with_rules
    total = 0
    @games.each do |game|
      total += count_game_with_rules(game)
    end
    total
  end

  def count_game(game)
    opponent_choice = game[0]
    your_choice = game[1]
    game_result(your_choice, opponent_choice) + @shape_score[your_choice]
  end

  def count_game_with_rules(game)
    opponent_choice = game[0]
    your_choice = game[1]
    @shape_score[choice(your_choice, opponent_choice)] + @letter_score[your_choice]
  end

  def game_result(main_choice, opponent_choice)
    if main_choice == 'X'
      return 3 if opponent_choice == 'A'
      return 0 if opponent_choice == 'B'
      return 6 if opponent_choice == 'C'
    elsif main_choice == 'Y'
      return 6 if opponent_choice == 'A'
      return 3 if opponent_choice == 'B'
      return 0 if opponent_choice == 'C'
    elsif main_choice == 'Z'
      return 0 if opponent_choice == 'A'
      return 6 if opponent_choice == 'B'
      return 3 if opponent_choice == 'C'
    end
  end

  def choice(letter, opponent_choice)
    if letter == 'X'
      return 'Z' if opponent_choice == 'A'
      return 'X' if opponent_choice == 'B'
      return 'Y' if opponent_choice == 'C'
    elsif letter == 'Y'
      return 'X' if opponent_choice == 'A'
      return 'Y' if opponent_choice == 'B'
      return 'Z' if opponent_choice == 'C'
    elsif letter == 'Z'
      return 'Y' if opponent_choice == 'A'
      return 'Z' if opponent_choice == 'B'
      return 'X' if opponent_choice == 'C'
    end
  end
end
print main('input.txt')

def main2(input)
  games = File.open(input).readlines.map { |line| line.chomp.split(' ') }
  ScoreCounter.new(games).count_total_with_rules
end
puts
print main2('input.txt')
