# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def won?(board)
  WIN_COMBINATIONS.each do |win_comb|
    if board[win_comb[0]] + board[win_comb[1]] + board[win_comb[2]] == "XXX" || board[win_comb[0]] + board[win_comb[1]] + board[win_comb[2]] == "OOO"
      return win_comb
    end
  end
  return false
end

def full?(board)
  (0..8).all? {|index| position_taken?(board, index)}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
  return false
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  end
  return false
end

def winner(board)
  if !won?(board)
    return nil
  else
    return board[won?(board)[0]]
  end
end
