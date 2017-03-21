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
  [2, 4, 6],
  [0, 4, 8]
]


def won?(board)

  WIN_COMBINATIONS.each do |win_combination|
    win_idx_1 = win_combination[0]
    win_idx_2 = win_combination[1]
    win_idx_3 = win_combination[2]

    position_1 = board[win_idx_1]
    position_2 = board[win_idx_2]
    position_3 = board[win_idx_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    end
  end

  false

end

def full?(board)
  board.all? do |space|
    space == "X" || space == "O"
  end
end

def draw?(board)
  return true if full?(board) && !(won?(board))
  false
end

def over?(board)
  return true if full?(board) || won?(board) || draw?(board)
  false
end

def winner(board)
  if won?(board)
    winning_index = won?(board)
    board[winning_index[0]]
  end
  
end
