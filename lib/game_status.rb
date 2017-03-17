# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =
[
  [0,1,2], #win top row
  [3,4,5], #win middle row
  [6,7,8], #win bottom row
  [0,3,6], #win left column
  [1,4,7], #win middle columns
  [2,5,8], #win right column
  [0,4,8], #win diagonal left to right
  [2,4,6]  #win diagonal right to left
]


def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = win_index_1
    position_2 = win_index_2
    position_3 = win_index_3
      if (board[position_1] == board[position_2] and board[position_1]== board[position_3]) &&
        position_taken?(board, position_1) && position_taken?(board, position_2) && position_taken?(board, position_3)
        true
      else
        false
      end
    end
  end

def full?(board)
  board.all? do |position| 
    position == "X" || position == "O"
  end
end

def draw?(board)
  if full?(board) and !(won?(board))
    true
  end
end 

def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  if !(won?(board))
    nil
  elsif board[won?(board)[0]] == "X"
    "X"
  else board[won?(board)[0]] == "O"
    "O"
  end
end
    
