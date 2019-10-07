# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    pos1 = combination[0]
    pos2 = combination[1]
    pos3 = combination[2]

    if((board[pos1] == "X" && board[pos2] == "X" && board[pos3] == "X") ||
        (board[pos1] == "O" && board[pos2] == "O" && board[pos3] == "O"))
      return combination
    end
  end
  return nil
end

def full?(board)
  return !board.include?(" ")
end

def draw?(board)
  return full?(board) && !won?(board)
end

def over?(board)
  return draw?(board) || won?(board)
end

def winner(board)
  combination = won?(board)
  return combination == nil ? nil : board[combination[0]]
end
