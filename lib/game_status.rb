# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #first column
  [1,4,7], #second column
  [2,5,8], #third column
  [0,4,8], #l_r diagnol
  [2,4,6], #r_l diagnol
]


def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    win_index_0 = win_combo[0]
    win_index_1 = win_combo[1]
    win_index_2 = win_combo[2]

    position_1 = board[win_index_0]
    position_2 = board[win_index_1]
    position_3 = board[win_index_2]

    if position_1 == position_2 && position_2 == position_3 && position_taken?(board,win_index_0)
      return win_combo
    end
  end
  return false
end


def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end


def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end


def over?(board)
  if won?(board) && full?(board)
    true
  elsif won?(board) && !full?(board)
    true
  elsif draw?(board) && full?(board)
    true
  else
    false
  end
end


def winner(board)
  if winner_combo = won?(board)
    board[winner_combo.first]
  end
end
