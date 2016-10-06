# Helper Method
 def position_taken?(board, index)
   !(board[index].nil? || board[index] == " ")
 end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]


def won?(board)
  WIN_COMBINATIONS.each do|win|

    win_index_1 = win[0]
    win_index_2 = win[1]
    win_index_3 = win[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win
      elsif  position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win
      end
    end
    return false
  end


def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end


def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end


def over?(board)
  draw?(board)||board
  full?(board)
end

def winner(board)
  WIN_COMBINATIONS.each do |win_combination|
   win_index_0 = win_combination[0]
   win_index_1 = win_combination[1]
   win_index_2 = win_combination[2]

   if board[win_index_0] == "X" && board[win_index_1] == "X" && board[win_index_2] == "X"
     return "X"
   elsif board[win_index_0] == "O" && board[win_index_1] == "O" && board[win_index_2] == "O"
     return "O"
   elsif !won?(board)
     return nil
   end
 end
end
