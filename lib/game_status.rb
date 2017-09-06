# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top Row Win
  [3,4,5], #Middle Row Win
  [6,7,8], #Bottom Row Win
  [0,3,6], #Left Column Win
  [1,4,7], #Middle Column Win
  [2,5,8], #Right Column Win
  [0,4,8], #Left Diagonal Win
  [2,4,6]  #Right Diagonal Win
]

def won?(board)
  winning_combination =
    WIN_COMBINATIONS.select do |win_combination|
    #win_combination is a 3 element array of indexes that composes a win
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

      if board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X"
        return win_combination
      elsif board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O"
        return win_combination
      end
    end

  empty_board = board.all? do |board_index|
    board_index == nil || board_index == " "
  end

  if empty_board
    return false
  elsif !empty_board && winning_combination == []
    return false
  else
    return winning_combination
  end

end

def full?(board)
  board.all? do |board_index|
    board_index == "X" || board_index == "O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  elsif !won?(board) && !full?(board)
    false
  elsif won?(board)
    false
  end
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board) != false && over?(board) && !draw?(board)
    if board[won?(board)[0]] == "X" && board[won?(board)[1]] == "X" && board[won?(board)[2]] == "X"
      return "X"
    elsif board[won?(board)[0]] == "O" && board[won?(board)[1]] == "O" && board[won?(board)[2]] == "O"
      return "O"
    end
  end
end
