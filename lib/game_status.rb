# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  
def won?(board)
  winner = false
  for indexes in WIN_COMBINATIONS
    a = indexes[0]
    b = indexes[1]
    c = indexes[2]
    if board[a] == 'X' && board[b] == 'X' && board[c] == 'X'
      winner = [a, b, c]
    elsif board[a] == 'O' && board[b] == 'O' && board[c] == 'O'
      winner = [a, b, c]
    end
  end
  winner
end

def full?(board)
  ! board.any? {|_| _ == " " || _ == "" || _ == nil}
end

def draw?(board)
  full?(board) && won?(board) == false ? true : false
end

def over?(board)
  won?(board) != false || draw?(board) || full?(board) ? true : false
end

def winner(board)
  winner = won?(board)
  winner != false ? winner = board[winner[0]] : winner = nil
  winner
end