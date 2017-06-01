# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Diagonal 1
    [2,4,6]  # Diagonal 2
]

def won?(board)
    WIN_COMBINATIONS.each do |win_combo|
        if board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X"
            return win_combo
        elsif board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
            return win_combo
        end
    end
    return false
end

def full?(board)
    board.all? do |space|
        if space == "X" || space == "O"
            true
        else
            false
        end
    end
end

def draw?(board)
    if !won?(board) && full?(board)
        true
    else
        false
    end
end

def over?(board)
    if won?(board) || draw?(board)
        true
    else
        false
    end
end

def winner(board)
    winning_row = won?(board)
    if won?(board)
        board[winning_row[0]]
    else
        nil
    end
end
