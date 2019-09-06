# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diagonal
  [2,4,6]  # Diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
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
        false
      end
    end
   false
end

def full?(board)
   board.all? { |e| e != " "}
end

def draw?(board)
   if won?(board) == false && full?(board) == true
     true
   elsif won?(board) == false && full?(board) == false
     false
   else won?(board) == true
     false
   end
end

def over?(board)
  if won?(board) != false || full?(board) == true || draw?(board) == true
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    index = won?(board)[0]
    board[index]
  end
end
