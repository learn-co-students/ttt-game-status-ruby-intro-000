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
  WIN_COMBINATIONS.each do |array|
    winning_cell_1 = array[0]
    winning_cell_2 = array[1]
    winning_cell_3 = array[2]
    check_1 = board[winning_cell_1]
    check_2 = board[winning_cell_2]
    check_3 = board[winning_cell_3]
    if (check_1 == "X" || check_1 == "O")
        if(check_1 == check_2 && check_2 == check_3)
          return array
        end
      end
    end
  return false
end

def full?(board)
  check = board.all? do |cell|
    cell != " "
  end
  return check
end

def draw?(board)
  if full?(board)
    if(!won?(board))
      return true
    end
  else
    return false
  end
end

def over?(board)
  if (won?(board) || draw?(board) || full?(board))
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    cells = won?(board)
    return board[cells[0]]
  end
  return nil
end
