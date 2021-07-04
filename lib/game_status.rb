# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
def won?(board)
  WIN_COMBINATIONS.detect do |set|
    board[set[0]] == board[set[1]] && board[set[1]] == board[set[2]] &&
    position_taken?(board, set[0])
  end
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  !won?(board) && board.all? do |check|
    check == "X" || check == "O"
  end
end

def over?(board)
  won?(board) || draw?(board) || !board.all? do |wdf|
    wdf == "X" || "O"
  end
end

def winner(board)
  if winning_set = won?(board)
    board[winning_set.first]
  end
end
