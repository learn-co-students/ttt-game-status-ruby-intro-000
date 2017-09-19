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
  [2,4,6]
]

def won?(board)
  if board.all? {|pos| pos == " " || pos == nil}
    return false
  end

  WIN_COMBINATIONS.each do |arr|
    if position_taken?(board, arr[0]) && board[arr[0]] == board[arr[1]] && board[arr[1]] == board[arr[2]]
      return arr
    end
  end
  false
end

def full?(board)
  board.all? {|pos| pos != " " && pos != nil}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
  false
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  end
  false
end

def winner(board)
  if won?(board)
    newarr = won?(board)
    return board[newarr[0]]
  end
end
