# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
  #Horizontal
  [0,1,2],
  [3,4,5],
  [6,7,8],

  #Vertical
  [0,3,6],
  [1,4,7],
  [2,5,8],

  #Diagonal
  [0,4,8],
  [2,4,6],
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if meets_win_combination?(board,win_combination)
      return meets_win_combination?(board,win_combination)
    end
  end
  return false
end

def meets_win_combination?(board,win_combination)
  values_in_win_combination_same = board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]]
  values_in_win_taken = board[win_combination[0]] == "X" || board[win_combination[0]]== "O"
  if values_in_win_combination_same && values_in_win_taken
    return win_combination
  else
    false
  end
end

def full?(board)
  return board.all?{|cell| cell == "X" || cell == "O"}
end

def draw?(board)
  return WIN_COMBINATIONS.any?{|win_combination| possible_win_combination?(board,win_combination)} || (full?(board) &&  !won?(board))
end

def possible_win_combination?(board,win_combination)
  values_in_win_combination_same = board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]]
  values_in_win_not_taken = board[win_combination[0]] == " " || board[win_combination[0]] == "   " || board[win_combination[0]] == nil
  return values_in_win_combination_same && values_in_win_not_taken
end

def over?(board)
  return draw?(board) || won?(board)
end

def winner(board)
  win_combination=won?(board)
  if !win_combination
    return nil
  else
    first_cell = win_combination[0]
    return board[first_cell]
  end
end
