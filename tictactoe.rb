require 'colorize'

class Player
  def initialize(name)
    @name = name
  end
end

class PlayerOne < Player
  attr_reader :name
  attr_accessor :player_one_moves

  @@p1_moves = []

  def add_move(num)
    @@p1_moves.push(num)
  end

  def show_moves
    @@p1_moves
  end
end

class PlayerTwo < Player
  attr_reader :name
  attr_accessor :player_two_moves

  @@p2_moves = []
  def add_move(number)
    @@p2_moves.push(number)
  end

  def show_moves
    @@p2_moves
  end
end

def is_int(n)
  if n.to_i != 0
    true
  else
    puts 'please enter a number from 1 to 9'
  end
end

def check_winner(array)
  winners = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 5, 9],
    [3, 5, 7],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9]
  ]

  winners.each do |win|
    return 'winner' if (win - array).empty?
  end
end

def start_up
  moves = 9
  board = "1 2 3 \n4 5 6 \n7 8 9"
  puts 'Welcome to the tic tac toe players!'
  puts "Player one's name?".colorize(:red)
  player_one = PlayerOne.new(gets.chomp)
  puts "Welcome #{player_one.name}".colorize(:yellow)
  puts "Player two's name ?>".colorize(:blue)
  player_two = PlayerTwo.new(gets.chomp)
  puts "Welcome #{player_two.name}".colorize(:green)

  puts board
  while moves > 0

    puts "#{player_one.name}'s turn".colorize(:yellow)
    move = gets.chomp
    if is_int(move)

      player_one.add_move(move.to_i)
      puts "player one moves are #{player_one.show_moves}"
      board = board.sub(move, 'X')

      moves -= 1
      if check_winner(player_one.show_moves) == 'winner'
        puts "#{player_one.name.upcase} wins this one".colorize(:yellow)
        return
      end

      puts board
    end
    puts "#{player_two.name}'s turn".colorize(:green)
    move = gets.chomp
    next unless is_int(move)

    player_two.add_move(move.to_i)
    puts "player two moves are #{player_two.show_moves}"
    board = board.sub(move, '0')
    moves -= 1
    if check_winner(player_two.show_moves) == 'winner'
      puts "#{player_two.name.upcase} wins".colorize(:green)
      return
    end
    puts board

  end
end
start_up
