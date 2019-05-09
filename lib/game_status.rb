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
  [6,4,2]
]

def won?(board)
   WIN_COMBINATIONS.each do |win_combination|
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]

     position_1 = board[win_index_1] # value of board at win_index_1
     position_2 = board[win_index_2] # value of board at win_index_2
     position_3 = board[win_index_3] # value of board at win_index_3

     if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_2)
       return win_combination
     end
   end
   false
end

def full?(board)
  board.all? {|i| i == "X" || i == "O"}
end

def draw?(board)
   if !won?(board) && full?(board)
     return true
   end
   false
end

def over?(board)
   if draw?(board) || won?(board) || full?(board)
     return true
   end
   false
end

def winner(board)
   if won?(board)
      return board[won?(board)[0]]
   end
end
