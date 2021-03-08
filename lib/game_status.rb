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

def won?(board)
  result = false
  WIN_COMBINATIONS.each { |win_combination|

    win_indexs = [
      win_combination[0],
      win_combination[1],
      win_combination[2]
  ]
    board_positions = [
      board[win_indexs[0]],
      board[win_indexs[1]],
      board[win_indexs[2]]
  ]
  #use of the full? function takes in a partial board a verifies no spaces are empty
    if (board_positions[0] == board_positions[1] && board_positions[1] == board_positions[2]) && full?(board_positions)
      result = win_combination
    end
  }
  return result
end

def full?(board)
  return !board.any? {|position| position == " " || position.nil?}
end

def draw?(board)
   return full?(board) && !won?(board)
 end

def over?(board)
  return full?(board) || won?(board) || draw?(board)
end

def winner(board)
  win_condition = won?(board)
  if win_condition != false
    return board[win_condition[0]]
  else
    return nil
  end
end
