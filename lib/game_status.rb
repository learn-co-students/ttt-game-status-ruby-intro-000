# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[6,4,2],
]

def won?(board)
  WIN_COMBINATIONS.each do |a|
      if board[a[0]] == "X" && board[a[1]] == "X" && board[a[2]] == "X"
        return a
      elsif board[a[0]] == "O" && board[a[1]] == "O" && board[a[2]] == "O"
      return a
    end
  end
  return false
end


def full?(board)
 board.include?(" ") ? false : true
end

def draw?(board)
  won?(board) ? false : true
end


def over?(board)
 if  won?(board).class == Array
   return true
 elsif full?(board)
 return true
 elsif draw?(board)
 return false
 end
end

def winner(board)
  WIN_COMBINATIONS.each do |a|
      if board[a[0]] == "X" && board[a[1]] == "X" && board[a[2]] == "X"
        return "X"
      elsif board[a[0]] == "O" && board[a[1]] == "O" && board[a[2]] == "O"
      return "O"
    end
  end
  return nil
end
