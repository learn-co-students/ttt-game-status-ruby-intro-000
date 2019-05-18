# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def who_won?(board)
    o_index_arr=[]
    x_index_arr=[]
    board.each_index do |slot|
      if board [slot] == "O"
        o_index_arr << slot
      elsif board [slot] == "X"
        x_index_arr << slot
      end
    end

    counter=0
    while counter != 8
      if    (WIN_COMBINATIONS[counter] - o_index_arr).empty?   # O  winner?
        return "O won"
      elsif (WIN_COMBINATIONS[counter] - x_index_arr).empty?   # X  winner?
        return "X won"
      end
      counter += 1
    end
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
  def won? (board, win_possibility = WIN_COMBINATIONS)
    if board.all?{|slot| slot.include?("X" || "O")}
      return false
    elsif board.all?{|slot| slot.include?("X" || "O")}
      return false
    else
      o_index_arr=[]
    x_index_arr=[]
    board.each_index do |slot|
      if board [slot] == "O"
        o_index_arr << slot
      elsif board [slot] == "X"
        x_index_arr << slot
      end
    end

    counter=0
    while counter != 8
      if    (WIN_COMBINATIONS[counter] - o_index_arr).empty?
        return WIN_COMBINATIONS[counter]
      elsif (WIN_COMBINATIONS[counter] - x_index_arr).empty?
        return WIN_COMBINATIONS[counter]
      end
      counter += 1
    end
  end
end

def full?(board)
  if board.all? { |slot| slot == "X" || slot == "O" }
    true
  else
    false
  end
end

def draw?(board)
  if (who_won?(board) == "O won") || (who_won?(board) == "X won")  #returns false for a won game
    return false
  elsif board.all? { |slot| (slot == "X") || (slot == "O") }       #returns true for a draw
    return true
  else
    return false
  end
end

def over?(board)
  if (who_won?(board) == "O won") || (who_won?(board) == "X won")   #returns true for a won game
     return true
  elsif board.all? { |slot| (slot == "X") || (slot == "O") }        #returns true for a draw
    return true
  else
    return false
  end
end

def winner(board)
  if who_won?(board) == "O won"
    return "O"
  elsif who_won?(board) == "X won"
    return "X"
  else
    return nil
  end
end
