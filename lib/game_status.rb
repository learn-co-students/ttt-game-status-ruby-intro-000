# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
    [0,1,2],
    [2,5,8],
    [0,4,8],
    [6,4,2],
    [0,3,6],
    [3,4,5],
    [6,7,8],
    [1,4,7],
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        nil
       end
     end
   end
=begin
   def full?(board)
     board.detect do |cells|
       if cells == "" || cells == " "
         false
       else
         true
       end
     end
   end
=end

   def full?(board)
     if board.detect {|cells| cells == " " || cells == ""}
        false
     else
        true
     end
   end

   def draw?(board)
     if full?(board) == true && won?(board) == nil
       true
     else
       false
     end
   end

   def over?(board)
     if won?(board) != nil
       true
     elsif draw?(board) == true
       true
     elsif full?(board) == false
       false
     end
   end



   def winner(board)
    if won?(board) != nil
       won = won?(board)
         board[won[0]]
     end
   end
