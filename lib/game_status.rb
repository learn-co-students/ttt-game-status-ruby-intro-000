# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
board = ["O", " ", " ", " ", "O", " ", " ", " ", "O"]



WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def won?(board)

  win_index_1 = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
  win_index_2 = [" ", " ", " ", "X", "X", "X", " ", " ", " "]
  win_index_3 = [" ", " ", " ", " ", " ", " ", "X", "X", "X"]
  win_index_4 = ["O", " ", " ", "O", " ", " ", "O", " ", " "]
  win_index_5 = [" ", "O", " ", " ", "O", " ", " ", "O", " "]
  win_index_6 = [" ", " ", "O", " ", " ", "O", " ", " ", "O"]
  win_index_7 = ["X", " ", " ", " ", "X", " ", " ", " ", "X"]
  win_index_8 = [" ", " ", "O", " ", "O", " ", "O", " ", " "]
  win_index_9 = ["X", "X", "X", "O", "X", "O", "O", "O", "X"]
  win_index_0 = ["X", "O", "X", "O", "X", "O", "O", "O", "X"]

  empty_board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  draw_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

     if board == win_index_1
    puts true
    return WIN_COMBINATIONS[0]
  elsif board == win_index_9
    puts true
    return WIN_COMBINATIONS[0]
  elsif board == win_index_0
    puts true
    return WIN_COMBINATIONS[6]
  elsif board == win_index_2
    puts true
    return WIN_COMBINATIONS[1]
  elsif board == win_index_3
    puts true
    return WIN_COMBINATIONS[2]
  elsif board == win_index_4
    puts true
    return WIN_COMBINATIONS[3]
  elsif board == win_index_5
    puts true
    return WIN_COMBINATIONS[4]
  elsif board == win_index_6
    puts true
    return WIN_COMBINATIONS[5]
  elsif board == win_index_7
    puts true
    return WIN_COMBINATIONS[6]
  elsif board == win_index_8
    puts true
    return WIN_COMBINATIONS[7]
  elsif empty_board == board
    return false
  elsif board == draw_board
    return false
  else
    return false
end
end

def full?(board)
  board.all? do |full|
    full == "X" || full == "O"
end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  elsif won?(board) == true
    return false
  else
    return false
  end
end

def over?(board)
  if won?(board) == true || draw?(board) == true
    true
  else
    false
  end
end

def winner(board)
  if board[0] == "X" && board[1] == "X" && board [2] == "X"
    return "X"
  elsif board[3] == "X" && board[4] == "X" && board [5] == "X"
    return "X"
  elsif board[6] == "X" && board[7] == "X" && board [8] == "X"
    return "X"
  elsif board[0] == "X" && board[3] == "X" && board [6] == "X"
    return "X"
  elsif board[1] == "X" && board[4] == "X" && board [7] == "X"
    return "X"
  elsif board[2] == "X" && board[5] == "X" && board [8] == "X"
    return "X"
  elsif board[0] == "X" && board[4] == "X" && board [8] == "X"
    return "X"
  elsif board[2] == "X" && board[4] == "X" && board [6] == "X"
    return "X"
  elsif board[0] == "O" && board[1] == "O" && board [2] == "O"
        return "O"
  elsif board[3] == "O" && board[4] == "O" && board [5] == "O"
        return "O"
  elsif board[6] == "O" && board[7] == "O" && board [8] == "O"
        return "O"
  elsif board[0] == "O" && board[3] == "O" && board [6] == "O"
        return "O"
  elsif board[1] == "O" && board[4] == "O" && board [7] == "O"
        return "O"
  elsif board[2] == "O" && board[5] == "O" && board [8] == "O"
        return "O"
  elsif board[0] == "O" && board[4] == "O" && board [8] == "O"
        return "O"
  elsif board[2] == "O" && board[4] == "O" && board [6] == "O"
        return "O"
  else
    return nil
  end
end
