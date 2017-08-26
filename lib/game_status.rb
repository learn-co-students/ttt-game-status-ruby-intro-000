# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

top_row_win = [0,1,2]
middle_row_win = [3,4,5]
bottom_row_win = [6,7,8]
left_column_win = [0,3,6]
middle_column_win = [1,4,7]
right_column_win = [2,5,8]
left_diagonal_win = [0,4,8]
right_diagonal_win = [2,4,6]

WIN_COMBINATIONS = [top_row_win, middle_row_win, bottom_row_win, left_column_win, middle_column_win, right_column_win, left_diagonal_win, right_diagonal_win]


def won?(board)
  WIN_COMBINATIONS.each do |winIndex|

    position_1 = board[winIndex[0]]
    position_2 = board[winIndex[1]]
    position_3 = board[winIndex[2]]

     if position_1 == "X" && position_2 == "X" && position_3 == "X"
       return winIndex
     elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
       return winIndex
     end
     end

     return false
   end

def full?(board)
  board.none?{|i| i == " "}
#   if board.none?{|i| i == " "}
#    return true
#   else
#     return false
#   end
 end

def draw?(board)
  !won?(board) && full?(board)
  # if won?(board) == false && full?(board) == true
  #  return true
  # else
  #  return false
  # end
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end
