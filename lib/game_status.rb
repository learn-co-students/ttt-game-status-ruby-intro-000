# Helper Method
def position_taken?(board, index)
position = board[index]
  if position == " "
    return false
  elsif position==""
    return false
  elsif position==nil
    return false
  elsif position == "X"
    return true
  elsif position=="O"
    return true
  end
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
  [2,4,6]
]

def won?(board)
count = 0
  while count<8 do
    if board.all? {|empty| empty==" "}
       return false
    elsif position_taken?(board, WIN_COMBINATIONS[count][0])&&position_taken?(board, WIN_COMBINATIONS[count][1])&&position_taken?(board, WIN_COMBINATIONS[count][2])&&board[WIN_COMBINATIONS[count][0]]==board[WIN_COMBINATIONS[count][1]]&&board[WIN_COMBINATIONS[count][1]]==board[WIN_COMBINATIONS[count][2]]
       return WIN_COMBINATIONS[count]
       break
    end
     count+=1
  end
if full?(board)&&count==8
   return false
end
end

def full?(board)
  if board.any?{|empty| empty==" "}
    return false
  else
    return true
  end
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board)
    return true
  else
    return false
  end
end

def over?(board)
if won?(board)
  return true
elsif full?(board)
  return true
else
  return false
end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end
