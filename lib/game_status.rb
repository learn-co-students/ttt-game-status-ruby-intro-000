# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
                    [0,1,2],#top_row_win
                    [3,4,5],#middle_row_win
                    [6,7,8],#bottom_row_win
                    [0,3,6],#left_col_win
                    [1,4,7],#middle_col_win
                    [2,5,8],#right_col_win
                    [0,4,8],#diagonal_1_win
                    [2,4,6] #diagonal_2_win
                  ]

def won?(board)
  a=false
  WIN_COMBINATIONS.each do |i|
    if board[i[0]]=="X" && board[i[1]]=="X" && board[i[2]]=="X"
      a= i
    end
    if board[i[0]]=="O" && board[i[1]]=="O" && board[i[2]]=="O"
      a= i
    end
  end
  return a
end

def full?(board)
  return board.all?{|i| !(i.nil? || i == " ") }
end

def draw?(board)
  if full?(board)
    return !won?(board)
  else
    return false
  end
end


def over?(board)
  if draw?(board)
    return true
  elsif won?(board)==false
    return false
  else
    return true
  end
end

def winner?(board)
  if won?(board)==false
    return nil
  else
    board[won?(board)[0]]
  end
end
