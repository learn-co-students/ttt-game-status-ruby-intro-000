# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
                  [0, 1, 2],
                  [3, 4, 5],
                  [6, 7, 8], #^across
                  [0, 3, 6],
                  [1, 4, 7],
                  [2, 5, 8], #^down
                  [0, 4, 8],
                  [2, 4, 6] #^diagonal
                   ]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    arr1 = combo[0]
    arr2 = combo[1]
    arr3 = combo[2]

      if ((board[arr1] == "X") && (board[arr2] == "X") && (board[arr3] == "X")) || ((board[arr1] == "O") && (board[arr2] == "O") && (board[arr3] == "O"))
       combo
     end

  end
end

def full?(board)
  board.all? { |x_o| x_o == "X" || x_o == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board) != nil
   won_array = won?(board)
   return board[won_array[0]]
  end

end
