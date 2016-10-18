# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


#0 1 2
#3 4 5
#6 7 8
# Define your WIN_COMBINATIONS constant
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

def won? (board) #it has to iterate over every nested array, to check if it matches. if it matches, return the array.
    winner_in = ""
    counter = 0
    WIN_COMBINATIONS.each { |win_combination|
      index_1 = win_combination[0]
      index_2 = win_combination[1]
      index_3 = win_combination[2]
      win_1 = board[index_1]
      win_2 = board[index_2]
      win_3 = board[index_3]
       if win_1 == "X" && win_2 == "X" && win_3 == "X"
         winner_in = "X"
         return win_combination
       elsif win_1 == "O" && win_2 == "O" && win_3 == "O"
         winner_in = "O"
         return win_combination
       else
         counter += 1
       end
       if counter == 8 #if it failed for every factor, it means it's either a draw or the game is still in progress.
         return false
       end
       }
 end

def draw?(board)
  if won?(board) == false
    if board.any? {|b| b.to_i == " " }
      return false
    else
      return true
    end
  end
end

def full?(board)
  board.none? { |b| b == " " || b == " " || b == nil}
end



def over?(board)
  if full?(board) == true
    return true
    if won?(board) == true
      return true
      if draw?(board) == true
      end
    end
  else
    return false
  end
end

def winner(board)
  if won?(board) != false
   win_array = won?(board)
   return board[win_array[1]]
 else
   return nil
end
end
