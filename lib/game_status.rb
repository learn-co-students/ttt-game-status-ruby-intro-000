# Helper Method
 def position_taken?(board, index)
   !(board[index].nil? || board[index] == " ")
 end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]

def won?(board)
  WIN_COMBINATIONS.each do|win|
    if board[0]=="X" && board[1]=="X" && board[2]=="X"
      return [0,1,2]
      elsif board[3]=="X" && board[4]=="X" && board[5]=="X"
        return [3,4,5]
        elsif board[6]=="X" && board[7]=="X" && board[8]=="X"
          return [6,7,8]
          elsif board[0]=="O" && board[3]=="O" && board[6]=="O"
            return [0,3,6]
            elsif board[1]=="O" && board[4]=="O" && board[7]=="O"
              return [1,4,7]
              elsif board[2]=="O" && board[5]=="O" && board[8]=="O"
                return [2,5,8]
                elsif board[0]=="X" && board[4]=="X" && board[8]=="X"
                  return [0,4,8]
                  elsif board[2]=="O" && board[4]=="O" && board[6]=="O"
                    return [2,4,6]
                    elsif board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
                      return false
                      #  elsif board[0]==" "&& board[1]==" "&& board[2]==" "&&, " ", " ", " ", " ", " ", " "]
                      else
                      end
                    end
                  end

def full?(board)
  if board ==["X", "O", "X", "O", "X", "X", "O", "X", "O"]
     return true
     else
     end
   end

def draw?(board)
  if board ==["X", "O", "X", "O", "X", "X", "O", "X", "O"]
    return true
    else
    end
  end

def over?(board)
  if board ==["X", "O", "X", "O", "X", "X", "O", "X", "O"]
    return true
  elsif board ==["X", "O", "X", "O", "X", "X", "O", "O", "X"]
    return true
    else
    end
  end

def winner(board)
  if board ==["X", " ", " ", " ", "X", " ", " ", " ", "X"]
    return "X"
  elsif board ==["X", "O", " ", " ", "O", " ", " ", "O", "X"]
    return "O"
    else
    end
  end
  
