# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #first column
  [1,4,7], #middle columns
  [2,5,8], #last columns
  [0,4,8], #right diagonal
  [2,4,6] #left diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |win|
    mark1 = board[win[0]]
    mark2 = board[win[1]]
    mark3 = board[win[2]]

    if mark1 == "X" && mark2 == "X" && mark3 == "X"
      return win
    elsif mark1 == "O" && mark2 == "O" && mark3 == "O"
      return win
    end
  end
  return false
end

def full?(board)
  board.none? do |a|
    a == " "
  end
end

def draw?(board)
  WIN_COMBINATIONS.each do |win|
    mark1 = board[win[0]]
    mark2 = board[win[1]]
    mark3 = board[win[2]]

    if mark1 == "X" && mark2 == "X" && mark3 == "X"
      return false
    elsif mark1 == "O" && mark2 == "O" && mark3 == "O"
      return false
    end
  end
  return true
end

def over?(board)
  WIN_COMBINATIONS.each do |win|
    mark1 = board[win[0]]
    mark2 = board[win[1]]
    mark3 = board[win[2]]

    if mark1 == "X" && mark2 == "X" && mark3 == "X"
      return true
    elsif mark1 == "O" && mark2 == "O" && mark3 == "O"
      return true
    elsif board.none? { |b| b == " " }
      return true
    end
  end
  return false
end

def winner(board)
  if won?(board)
    winning_comb = won?(board)
    winning_token = board[winning_comb[0]]

    if winning_token == "X"
      return "X"
    elsif winning_token == "O"
      return "O"
    end

  else
    return nil
  end
end
