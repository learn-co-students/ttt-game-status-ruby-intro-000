# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top_row
  [3, 4, 5], #middle_row
  [6, 7, 8], #bottom_row
  [0, 3, 6], #left_column
  [1, 4, 7], #middle_column
  [2, 5, 8], #right_column
  [0, 4, 8], #diagonal_1
  [2, 4, 6]  #diagonal_2
]

def won?(board)
  WIN_COMBINATIONS.detect do | win_combination |
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      win_combination
    else
      false
    end
  end
end


def full?(board)
  board.all? { | i | i != " " }
end


def draw?(board)
  full?(board) && !won?(board)
end


def over?(board)
  won?(board) || full?(board) || draw?(board)
end


def winner(board)
  if winner = won?(board)
    board[winner[0]]
  end
end
