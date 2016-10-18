  board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
  #board = [" ", " ", " ", "X", "X", "X", " ", " ", " "]

WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #second row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left column
  [1, 4, 7], #middle column
  [2, 5, 8], #right column
  [0, 4, 8], #diagonal left to right
  [2, 4, 6]  #diagonal right to left
]
winning = WIN_COMBINATIONS.each { |win_combination|
  index_1 = win_combination[0]
  index_2 = win_combination[1]
  index_3 = win_combination[2]
  win_1 = board[index_1]
  win_2 = board[index_2]
  win_3 = board[index_3]
   if win_1 == "X" && win_2 == "X" && win_3 == "X"
     return win_combination
   elsif win_1 == "O" && win_2 == "O" && win_3 == "O"
     return win_combination
   else
     next false
   end
       }
 puts winning
