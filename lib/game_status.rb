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
[6,4,2]


]

def winner(board)
  index=[]
  index=won?(board)
  if index==false
    return nil
  else
    if board[index[0]]== "X"
      return "X"
    else
      return "O"
    end
  end
end


def won?(board)
  WIN_COMBINATIONS.each {|wc|
  win_index_1=wc[0]
  win_index_2=wc[1]
  win_index_3=wc[2]

p1=board[win_index_1]
p2=board[win_index_2]
p3=board[win_index_3]

if p1== "X"&&p2=="X"&&p3=="X"
  return wc
elsif p1== "O"&&p2=="O"&&p3=="O"
  return wc
end
}
return false
end

def full?(board)
  board.all? {|index| index == "X" || index=="O" }
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end



def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end
