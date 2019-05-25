# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  xNums = []
  oNums = []
  x = 0
  while x < board.length do
    if board[x] == "X"
      xNums.push(x)
    elsif board[x] == "O"
      oNums.push(x)
    end
    x += 1
  end
  if won_helper(xNums) != false
    return won_helper(xNums)
  else
    return won_helper(oNums)
  end
end

def won_helper(arr)
  r = 0
  c = 0
  winner = 0
  while r < WIN_COMBINATIONS.length #because I can
    while c < WIN_COMBINATIONS[r].length
      if arr.include? WIN_COMBINATIONS[r][c] #because I can
        winner += 1
        if winner == 3
          winning_array = [] #to prevent potential side effect we will return a copy
          x = 0
          while x < WIN_COMBINATIONS[r].length
            winning_array.push(WIN_COMBINATIONS[r][x])
            x += 1
          end
          return winning_array
        else
          c += 1
          next
        end
      end
      c += 1
    end
    c = 0
    r += 1
    winner = 0
  end
  return false
end

def full?(board)
  board.all? do |val|
    val == "X" || val == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board) ? true : false
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  end
end

def winner(board)
  if won?(board) != false && board[won?(board)[0]] == "X"
    return "X"
  elsif won?(board) != false && board[won?(board)[0]] == "O"
    return "O"
  else
    return nil
  end
end
