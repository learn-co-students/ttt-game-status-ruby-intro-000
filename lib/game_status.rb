# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
   [0, 1, 2], #top row
   [3, 4, 5], #middle row
   [6, 7, 8], #bottom row
   [0, 3, 6], #left column
   [1, 4, 7], #middle column
   [2, 5, 8], #right column
   [0, 4, 8], #top-left, middle-middle, bottom-right
   [2, 4, 6]  #top-right, middle-middle, bottom-left
]

def won?(board)

   # if board[WIN_COMBINATIONS[0][0]] == "X" && board[WIN_COMBINATIONS[0][1]] == "X" && board[WIN_COMBINATIONS[0][2]] == "X"
   #    return WIN_COMBINATIONS[0]
   # elsif board[WIN_COMBINATIONS[1][0]] == "X" && board[WIN_COMBINATIONS[1][1]] == "X" && board[WIN_COMBINATIONS[1][2]] == "X"
   #    return WIN_COMBINATIONS[1]
   # elsif board[WIN_COMBINATIONS[2][0]] == "X" && board[WIN_COMBINATIONS[2][1]] == "X" && board[WIN_COMBINATIONS[2][2]] == "X"
   #    return WIN_COMBINATIONS[2]
   # elsif board[WIN_COMBINATIONS[3][0]] == "X" && board[WIN_COMBINATIONS[3][1]] == "X" && board[WIN_COMBINATIONS[3][2]] == "X"
   #    return WIN_COMBINATIONS[3]
   # elsif board[WIN_COMBINATIONS[4][0]] == "X" && board[WIN_COMBINATIONS[4][1]] == "X" && board[WIN_COMBINATIONS[4][2]] == "X"
   #    return WIN_COMBINATIONS[4]
   # elsif board[WIN_COMBINATIONS[5][0]] == "X" && board[WIN_COMBINATIONS[5][1]] == "X" && board[WIN_COMBINATIONS[5][2]] == "X"
   #    return WIN_COMBINATIONS[5]
   # elsif board[WIN_COMBINATIONS[6][0]] == "X" && board[WIN_COMBINATIONS[6][1]] == "X" && board[WIN_COMBINATIONS[6][2]] == "X"
   #    return WIN_COMBINATIONS[6]
   # elsif board[WIN_COMBINATIONS[7][0]] == "X" && board[WIN_COMBINATIONS[7][1]] == "X" && board[WIN_COMBINATIONS[7][2]] == "X"
   #    return WIN_COMBINATIONS[7]
   #
   # elsif board[WIN_COMBINATIONS[0][0]] == "O" && board[WIN_COMBINATIONS[0][1]] == "O" && board[WIN_COMBINATIONS[0][2]] == "O"
   #    return WIN_COMBINATIONS[0]
   # elsif board[WIN_COMBINATIONS[1][0]] == "O" && board[WIN_COMBINATIONS[1][1]] == "O" && board[WIN_COMBINATIONS[1][2]] == "O"
   #    return WIN_COMBINATIONS[1]
   # elsif board[WIN_COMBINATIONS[2][0]] == "O" && board[WIN_COMBINATIONS[2][1]] == "O" && board[WIN_COMBINATIONS[2][2]] == "O"
   #    return WIN_COMBINATIONS[2]
   # elsif board[WIN_COMBINATIONS[3][0]] == "O" && board[WIN_COMBINATIONS[3][1]] == "O" && board[WIN_COMBINATIONS[3][2]] == "O"
   #    return WIN_COMBINATIONS[3]
   # elsif board[WIN_COMBINATIONS[4][0]] == "O" && board[WIN_COMBINATIONS[4][1]] == "O" && board[WIN_COMBINATIONS[4][2]] == "O"
   #    return WIN_COMBINATIONS[4]
   # elsif board[WIN_COMBINATIONS[5][0]] == "O" && board[WIN_COMBINATIONS[5][1]] == "O" && board[WIN_COMBINATIONS[5][2]] == "O"
   #    return WIN_COMBINATIONS[5]
   # elsif board[WIN_COMBINATIONS[6][0]] == "O" && board[WIN_COMBINATIONS[6][1]] == "O" && board[WIN_COMBINATIONS[6][2]] == "O"
   #    return WIN_COMBINATIONS[6]
   # elsif board[WIN_COMBINATIONS[7][0]] == "O" && board[WIN_COMBINATIONS[7][1]] == "O" && board[WIN_COMBINATIONS[7][2]] == "O"
   #    return WIN_COMBINATIONS[7]
   # else
   #    return false
   # end


   WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
         return win_combination
      else
         false
      end

   end
   false
end

def full?(board)
   status = true

   board.each do |element|
      if element == " "
         status = false
      end
   end

   return status
end

def draw?(board)
   if won?(board) == false && full?(board) == true
      return true
   end
   if won?(board) == true && full?(board) == false
      return false
   end
end

def over?(board)
   if won?(board) == true || draw?(board) == true || full?(board) == true
      return true
   else
      return false
   end
end

# def winner(board)
#    all_tokens = nil
#    tokens = won?(board)
#
#    x = tokens[0]; y = tokens[1]; z = tokens[2]
#    puts board[x]; puts board[y]; puts board[z]
#
#    tokens.all? do |token|
#       if token == "X"
#          all_tokens = "X"
#       end
#       if token == "O"
#          all_tokens = "O"
#       end
#    end
#    all_tokens
# end
#
# winner(board = ["X", " ", " ", " ", "X", " ", " ", " ", "X"])


def winner(board)

   # won_board = won?(board)
   #
   # x = won_board[0]; y = won_board[1]; z = won_board[2]

   # puts board[x]
   # puts board[y]
   # puts board[z]

   if won?(board)
      won_board = won?(board)
      x = won_board[0]
      board[x]
   end

end

# def winner(board)
#
# end


# winner(board = [" ", " ", " ", "O", "O", "O", " ", " ", " "])
