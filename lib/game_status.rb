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
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
      if position_taken?(board, win_combo[0]) && position_taken?(board, win_combo[1]) && position_taken?(board, win_combo[2]) && board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]] == board[win_combo[2]]
        return win_combo
      end
  end
  return false
end

def full?(board)
  counter = 0
  (0..9).each do |index|
    if position_taken?(board, index)
      counter += 1
    end
  end
  if counter > 8
    return true
  else
    return false
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board)
    return true
  elsif full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    won?(board).each do |index|
      return board[index]
    end
  else
    return nil
  end
end
