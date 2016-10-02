# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  return_array = []

  WIN_COMBINATIONS.each do | win_combo |
    if win_combo.all?{ | i | board[i] == "X"} || win_combo.all?{ | i | board[i] == "O"}
      return_array = win_combo
    end
  end

  if return_array == []
    false
  else
    return_array
  end
end

def full?(board)
  if board.all?{ | i | i != " "}
    true
  else
    false
  end
end

def draw?(board)
  if won?(board) == false
    if full?(board) == true
      true
    end
  else
    false
  end
end

def over?(board)
  if won?(board) != false || draw?(board) == true
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != false
    return board[won?(board)[0]]
  end
end
