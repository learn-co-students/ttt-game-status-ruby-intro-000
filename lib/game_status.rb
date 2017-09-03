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
  winning_combination = []
WIN_COMBINATIONS.select do |comb|
  if board[comb[0]] == "X" && board[comb[1]] == "X" && board[comb[2]] == "X"
    winning_combination = comb
  elsif board[comb[0]] == "O" && board[comb[1]] == "O" && board[comb[2]] == "O"
    winning_combination = comb
  end
end
if winning_combination == []
  winning_combination = false
end
winning_combination
end

def full?(board)
board.all? do |space|
  space == "X" || space == "O"
end
end

def draw?(board)
full?(board) && !won?(board)
end

def over?(board)
won?(board) || draw?(board)
end

def winner(board)
array = won?(board)
x = nil
if array != false
  x = board[array[0]]
end

end
