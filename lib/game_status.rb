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
  WIN_COMBINATIONS.each do |sub_array|
    if (board[sub_array[0]] == "X" && board[sub_array[1]] == "X" && board[sub_array[2]] == "X")
      return sub_array
    elsif (board[sub_array[0]] == "O" && board[sub_array[1]] == "O" && board[sub_array[2]] == "O")
      return sub_array
    end
  end
  false
end

def full?(board)
  board.none? {|el| el == " "}
end
def draw?(board)
  if (full?(board)) && !(won?(board))
    return true
  end
  false
end

def over?(board)
  if (full?(board) || draw?(board) || won?(board))
    return true
  end
  false
end

def winner(board)
  sub_array = []
    if (won?(board))
      sub_array = won?(board)
      if (sub_array[0] == "X" )
        return "X"
      else
        return "O"
      end
    end
    nil
  end
