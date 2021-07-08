# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
]

def won?(board)
  empty_board = board.all? do |space|
    space == " "
  end
  if empty_board
    return false
  end
  WIN_COMBINATIONS.each do |array|
    all_taken = position_taken?(board, array[0]) && position_taken?(board, array[1]) && position_taken?(board, array[2])
    if all_taken && board[array[0]] == board[array[1]] && board[array[0]] == board[array[2]]
      return array
    end
  end
  false
end

def full?(board)
  full_board = board.all? do |character|
    character == "X" || character == "O"
  end
end

def draw?(board)
  if won?(board)
    return false
  end
  if full?(board)
    return true
  end
  false
end

def over?(board)
  if won?(board)
    return true
  end
  if draw?(board)
    return true
  end
  false
end

def winner(board)
  array = won?(board)
  if array
    return board[array[0]]
  end
end
