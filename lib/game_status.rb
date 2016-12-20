# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,4,8], #Diag 1
  [2,4,6], #Diag 2
  [0,3,6], #left column
  [1,4,7], #mid column
  [2,5,8] #right column
]

def won?(board)
  result = nil
  WIN_COMBINATIONS.each do |win_combination|
    #  for each win_combination in WIN_COMBINATIONS
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination # return the win_combination indexes that won.
    else
      result = false
    end
  end
  return result
end

def full?(board)
  board.none? {|e| e == " "}
end

def draw?(board)
  if full?(board) && !(won?(board))
    return true  #it'sa draw
  else
    return false #not over, not a draw
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    board[won?(board)[0].to_i]
  else
   return nil
 end
end
