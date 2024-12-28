play = [1, 5, 9]
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
    puts 'gano' if (win - array).empty?
  end
end
check_winner(play)
