# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  winner = []

  WIN_COMBINATIONS.each do |combo|
    value_1 = board[combo[0]]
    value_2 = board[combo[1]]
    value_3 = board[combo[2]]

    if value_1 == 'X' && value_2 == 'X' && value_3 == 'X'
      winner = combo
    elsif value_1 == 'O' && value_2 == 'O' && value_3 == 'O'
      winner = combo
    end
  end

  if winner.length == 3
    return winner
  else
    return false
  end
end

def full?(board)
  board.none?{|i| i == ' '}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  if won?(board) == false
    return nil
  elsif board[won?(board)[0]] == 'X'
    return 'X'
  elsif board[won?(board)[0]] == 'O'
    return 'O'
  # else
  #   return nil
  end
end
