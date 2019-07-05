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
  WIN_COMBINATIONS.each do |win_combination|
    first_strategy = board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
    second_strategy = board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
    if first_strategy == true || second_strategy == true
      return win_combination
    end
  end

  if WIN_COMBINATIONS.none? do |win_combination|
    board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X" || board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
  end
    false
  end
end

def full?(board)
  board.all?{|spot| spot == "X" || spot == "O"}
end

def draw?(board)
  victorious_array = won?(board)
  if victorious_array == false && full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  victorious_array = won?(board)
  if victorious_array != false
    true
  elsif draw?(board)
    true
  else
    false
  end
end

def winner(board)
  victorious_array = won?(board)
  if victorious_array != false
    board[victorious_array[0]]
  else
    nil
  end
end
