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
  WIN_COMBINATIONS.any?{|comb|
    if comb.all?{|pos| position_taken?(board, pos)}
      arr = [];
      comb.each{|pos| arr << board[pos]}
      if arr.uniq.size <=1
        return comb
      end
    end
  }
end

def full?(board)
  board.each_index.all?{|i| position_taken?(board,i)}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    board_index = won?(board)[0]
    if board[board_index] == "X"
      return "X"
    else
      return "O"
    end
  end
end

won?(["X", "X", "X", "O", "O", " ", " ", " ", " "])
