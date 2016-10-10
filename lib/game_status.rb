# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],
                    [0,3,6],[1,4,7],[2,5,8],
                    [0,4,8],[2,4,6]]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    (board[win_combo[0]]  == "X" && board[win_combo[1]]  == "X" && board[win_combo[2]]  == "X" ||
    board[win_combo[0]]  == "O" && board[win_combo[1]]  == "O" && board[win_combo[2]] == "O")
  end
end

def full?(board)
  board.any?{|item| item == " "} ? false : true
end

def draw?(board)
  full?(board) && !won?(board) ? true : false
end

def over?(board)
  won?(board) || draw?(board) ? true : false
end

def winner(board)
  if over?(board)  && won?(board)
    winning_board = won?(board)
    board[winning_board[0]] == "X" ? "X" : "O"
  elsif draw?(board)
    nil
  end
end
