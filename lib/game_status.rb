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

def full?(board)
  board.detect {|x|
  if (x == " " || x == nil)
    return false
  end
  }
  if draw?(board)
    return true
  end
end

def draw?(board)
  WIN_COMBINATIONS.each {|sub_array|
  if board[sub_array[0]] == board[sub_array[1]] && board[sub_array[1]] == board[sub_array[2]]
  return false
end
    }
end


def won?(board)
if draw?(board)
  return false
end
if !(board.include?("X" || "O"))
  return false
end
  WIN_COMBINATIONS.each {|sub_array|
  if board[sub_array[0]] != nil && board[sub_array[0]] != " " && board[sub_array[0]] == board[sub_array[1]] && board[sub_array[1]] == board[sub_array[2]]
  return sub_array
end
    }

end

def over?(board)
  if !(won?(board)) && !(full?(board))
    return false
  elsif draw?(board) || won?(board)
    return true
  end
end

def winner(board)
  if draw?(board)
    return nil
  elsif
    WIN_COMBINATIONS.each {|sub_array|
  if board[sub_array[0]] != nil && board[sub_array[0]] != " " && board[sub_array[0]] == board[sub_array[1]] && board[sub_array[1]] == board[sub_array[2]]
    if board[sub_array[2]] == "X"
return "X"
else
  return "O"
end
end
}
  end
end
