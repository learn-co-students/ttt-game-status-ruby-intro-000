# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
      if board[combo[0]] == "X" || board[combo[0]] == "O"
        return combo
      end
    end
  end
  return false
end

def full?(board)
  return !board.any? { |e| e == " " }
end

def draw?(board)
  return !won?(board) && full?(board)
end

def over?(board)
  return full?(board) || won?(board)
end

def winner(board)
  status = won?(board)
  if status != false
    return board[status[0]]
  else
    return nil
  end
end
