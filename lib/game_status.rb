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
  [2,4,6]
]
def won?(board)
   WIN_COMBINATIONS.each do |combination|
      if position_taken?(board, combination[0])
       if board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]]
         return combination
     end
  end
end
    false
end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end

def draw?(board)
    won?(board) == false && full?(board) == true
end

def over?(board)
    won?(board) == true || full?(board) == true || draw?(board) == true
end

def winner(board)
  if win_combination = won?(board)
   board[win_combination.first]
end
end
