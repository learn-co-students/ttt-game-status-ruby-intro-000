# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
#WIN_COMBINATIONS is a constant but it’s the parent array to our the children array.
#parent_array => WIN_COMBINATIONS = [ children_arrays ]
#children_arrays => [0,1,2],[3,4,5],[6,7,8]...[6,4,2]
WIN_COMBINATIONS = [
[0,1,2], # top_row
[3,4,5], # middle_row
[6,7,8], # bottom_row
[0,3,6], # left_column
[1,4,7], # center_column
[2,5,8], # right_column
[0,4,8], # left_diagonal
[6,4,2] # right_diagonal
]

#winning combo
def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = board[win_index_1] # value of board at win_index_1
      position_2 = board[win_index_2] # value of board at win_index_2
      position_3 = board[win_index_3] # value of board at win_index_3
      if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
        return win_combination
      end
    end
    return false
end
#position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
#The above code means to return first element (position_1) & make sure the position is taken by X or O

#define full board
def full?(board)
   board.all? {|i| i == "X" || i == "O"}
end

#draw method for tie game
def draw?(board)
   if !won?(board) && full?(board)
     return true
   elsif !won?(board) && !full?(board)
     return false
   else won?(board)
     return false
   end
end

#end game method if draw or won or full
def over?(board)
   if draw?(board) || won?(board) || full?(board)
     return true
   end
end

#determine the winner
def winner(board)
   if won?(board)
      return board[won?(board)[0]]
   end
end
