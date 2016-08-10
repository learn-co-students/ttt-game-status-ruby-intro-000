# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # first column
  [1,4,7], # second column
  [2,5,8], # third column
  [0,4,8], # top left to bottom right diagonal
  [2,4,6]  # top right to bottom left diagonal
]

# this one is not as elegant as I would like
# coming back to it once I'm done with the others
def won?(board)
  counter = 0
  while counter < WIN_COMBINATIONS.length
  win_index = WIN_COMBINATIONS[counter]
  position_1 = board[win_index[0]]
  position_2 = board[win_index[1]]
  position_3 = board[win_index[2]]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return WIN_COMBINATIONS[counter]
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return WIN_COMBINATIONS[counter]
    else
      counter += 1
    end
  end
end

def full?(board)
  board.all? do |position|
    !(position.nil? || position == " ")
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == nil
    return true
  else
    return false
  end
end

def over?(board)
  if full?(board) == true || draw?(board) == true || won?(board) != nil
    return true
  else
    return false
  end
end

def winner(board)
  winning_array = won?(board)
  if winning_array == nil
    return nil
  elsif board[winning_array[0]] == "O"
    return "O"
  else
    return "X"
  end
end
