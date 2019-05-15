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
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    if (board[win_index_1] == board[win_index_2] && board[win_index_2] == board[win_index_3]) && (board[win_index_1] == 'X' || board[win_index_1] == 'O')
      return win_combination
    end
  end
  return false
end

def full?(board)
  empty_items = board.select{|element| empty_position?(element)}
  if empty_items.length > 0
    false
  else
    true
  end
end

def empty_position?(position_value)
  if (position_value == "" || position_value == " ")
    true
  else
    false
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    win_combination = won?(board)
    board[win_combination[0]]
  end
end
