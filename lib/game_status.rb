# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,4,8],  # Left diagonal
  [2,4,6],  # Right diagonal
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8]  # Right column
  # An array for each win combination
]


# def won?(board)
#  no_win = true
#    WIN_COMBINATIONS.each do |win_combination|
#      win = []
#      win_combination.select do |position| #I have no idea what the below means
#        if position_taken?(board, position)
#          win << position
#          if win.length == 3 && win_combination == win && (board[win[0]] == board[win[1]] && board[win[0]] == board[win[2]])
#            no_win = false
#            return win_combination
#          end
#        end
#      end
#    end
#    if no_win
#     false
#    end
#  end


def won?(board)
   WIN_COMBINATIONS.detect do |win_combination|
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]

     position_1 = board[win_index_1]
     position_2 = board[win_index_2]
     position_3 = board[win_index_3]

     if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
       win_combination
     end
   end
 end

 def full?(board)
    [0,1,2,3,4,5,6,7,8].all?{|position| position_taken?(board, position)} #Why not board.all?
  end

def draw?(board)
  if won?(board) == nil && full?(board) == true
    true
  elsif (won?(board) == nil && full?(board) == false) || won?(board) != nil
    false
  end
end

def over?(board)
  if won?(board) != nil
    true
  elsif draw?(board) == true
    true
  else full?(board) == false
    false
  end
end

# def winner?(board)
#   if over?(board) == true && won?(board) != nil #Why not use == true
#       winner = won?(board)
#       return winner[0]
#   else
#       return  nil
#     end
#     winner
# end

def winner(board)
     if won?(board) != nil
        won = won?(board)
        return board[won[0]]
      end
    end
