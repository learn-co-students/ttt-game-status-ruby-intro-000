# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

board = [" "," "," "," "," "," "," "," "," "]

board.each do |item|
    if item == ""
        return false
    end
end

# Define your WIN_COMBINATIONS constant
#
WIN_COMBINATIONS = [
	[0,1,2],
	[6,7,8],
	[3,4,5],
	[0,3,6],
	[2,5,8],
	[1,4,7],
	[0,4,8],
	[2,4,6]
]

winner_val =

def won?(board)
    WIN_COMBINATIONS.each do | wins |
        if ((board[wins[0]] == "X" && board[wins[1]] == "X" && board[wins[2]] == "X") ||
           (board[wins[0]] == "O" && board[wins[1]] == "O" && board[wins[2]] == "O"))
           winner_val = board[wins[0]]
        return wins
        else
            false
        end
     end
       return false
end

def full?(board)
    if board.select {|item| item == " "} != []
        return false
    else
        return true
    end
end

def draw?(board)
    if full?(board) == true && won?(board) == false
        return true
    else
        return false
    end
end

def over?(board)
    if won?(board) != false || draw?(board) == true
        return true
    else
        return false
    end
end


def winner(board)
  if won?(board) == false
    return nil
  elsif board[won?(board)[0]] == "X"
    return "X"
  elsif board[won?(board)[0]] == "O"
    return "O"
  end
end


