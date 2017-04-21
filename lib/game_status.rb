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
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
      win_combination
    end
  end
end

def full?(board)
  board.all? do |index|
    index == "X" || index =="O"
  end
end

def draw?(board)
  if won?(board) == nil && full?(board) == true
    true
  elsif won?(board) == nil && full?(board) == false
    false
  else won?(board) != nil
    false
  end
end

def over?(board)
  if won?(board) != nil
    true
  elsif draw?(board) == true
    true
  else full?(board) == false
    false
  end
end

def winner(board)
  if over?(board) == true && won?(board) != nil
    winner = won?(board)
    board[winner[0]]
  else
    nil
  end
end
