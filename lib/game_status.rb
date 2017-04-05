# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
        [0, 1, 2],      # Top row
        [3, 4, 5],      # Middle row
        [6, 7, 8],      # Bottom row
        [0, 3, 6],      # left column
        [1, 4, 7],      # Middle column
        [2, 5, 8],      # Right column
        [0, 4, 8],      # Diagonal left
        [2, 4, 6]       #Diagonal right
]

def won?(board)
    WIN_COMBINATIONS.each do |win|
      win_index_1 = win[0]
      win_index_2 = win[1]
      win_index_3 = win[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win
      else
        false
      end
    end
    false
  end

def full?(board)
  board.all? do |index|
     index == "X" || index == "O"
   end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
   if won?(board)
     board[won?(board)[0]]
   end
 end
