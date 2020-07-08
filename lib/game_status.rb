# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  WIN_COMBINATIONS.find do |win_state|
  if board[win_state[0]] == "X" && board[win_state[1]] == "X" && board[win_state[2]] == "X"
    win_state
  elsif board[win_state[0]] == "O" && board[win_state[1]] == "O" && board[win_state[2]] == "O"
    win_state
  else
    false
  end
end
end# Define your WIN_COMBINATIONS constant

def empty (spot)
  if spot == " " then true else false
  end
  end

def full?(board)

   if board.find {|p| empty(p) } == " " then
     false
   else
     true
   end

end

def draw? (board)
  if won?(board) then
    false
  elsif !won?(board) && !full?(board)
    false
  elsif !won?(board) && full?(board)
    true
  end
end

def over?(board)
  if won?(board) then
    true
  elsif draw?(board)
    true
  elsif full?(board)
    true
  else
    false
  end
end

def winner(board)
  token = WIN_COMBINATIONS.find do |win_state|
    if board[win_state[0]] == "X" && board[win_state[1]] == "X" && board[win_state[2]] == "X" then
      "X"
    elsif board[win_state[0]] == "O" && board[win_state[1]] == "O" && board[win_state[2]] == "O"
      "O"
    else
      nil
    end
    end
    if token then board[token[0]] else nil end
end
