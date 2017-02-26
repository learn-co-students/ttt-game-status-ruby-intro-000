# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS =[
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]

def full?(board)
  board.all? do |square|
    square == "X" || square == "O"
  end
end

def empty?(board)
  board.none? do |square|
    square =="X" || square =="O"
  end
end

def won?(board)
    WIN_COMBINATIONS.each do |win_index|
      win_index_1 = win_index[0]
      win_index_2 = win_index[1]
      win_index_3 = win_index[2]
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X" ||
        position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_index
      else
        false
      end
    end
  return false
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  elsif !full?(board) && !won?(board)
    false
  elsif won?(board) != false
    false
  end
end

def over?(board)
  if won?(board) != false || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != false
    won?(board).each do |winning_square|
    winning_square_1 = winning_square[0]
    winning_square_2 = winning_square[1]
    winning_square_3 = winning_square[2]
    if board[winning_square_1] == "X"
      return "X"
    elsif board[winning_square_1] == "O"
      return "O"
    end
    end
  end
end
