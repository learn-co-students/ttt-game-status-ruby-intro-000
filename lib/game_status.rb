# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [0,3,6], #left column
  [0,4,8], #top left diagonal
  [1,4,7], #mid column
  [2,4,6], #top right diagonal
  [2,5,8], #right column
  [3,4,5], #mid row
  [6,7,8]  #bottom row
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if win_combination.all? { |i| position_taken?(board, i)}
      if board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]]
        return win_combination
      end
    end
  end
    return false
end

def full?(board)
  board.all?{ |i| i == "X" || i == "O" }
end

def draw?(board)
  if full?(board) && !(won?(board))
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
    return board[won?(board)[0]]
  end
end
