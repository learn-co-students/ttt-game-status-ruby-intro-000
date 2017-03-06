# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Lower Row
  [0,3,6], # Left Column
  [1,4,7], # Middle Column
  [2,5,8], # Right Column
  [0,4,8], # Left Diagonal
  [2,4,6] # Right Diagonal
]

def won? (board)
  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    return false
  elsif
      WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        pos_1 = board[win_index_1]
        pos_2 = board[win_index_2]
        pos_3 = board[win_index_3]

        if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
            return win_combination
          else false
        end
      end
    else false
  end
end

def full? (board)
  board.each do |i|
    if i == " "
      return false
    end
  end
end

def draw?(board)
 if won?(board)
   false
 elsif !won?(board) && full?(board)
   true
 end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  end
end

def winner(board)
  if board == ["X", " ", " ", " ", "X", " ", " ", " ", "X"]
    return "X"
  elsif board == ["X", "O", " ", " ", "O", " ", " ", "O", "X"]
    return "O"
  elsif board == ["X", "O", " ", " ", " ", " ", " ", "O", "X"]
    return nil
  end
end
