WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]]

  def won?(board)
    if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      return false
    else
      WIN_COMBINATIONS.each do |win_combo|
        win_index_1 = win_combo[0]
        win_index_2 = win_combo[1]
        win_index_3 = win_combo[2]

        position_1 = board[win_index_1]
        position_2 = board[win_index_2]
        position_3 = board[win_index_3]

        if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
          return win_combo
        end
      end
      false
    end
  end

  def full?(board)
    board.none? do |item|
      if (item == " ") && (won?(board) == false)
        true
      else
        false
      end
    end
  end

  def draw?(board)
    board.each do |item|
      return true if item != " " && (won?(board) == false)
    end
    false
  end

  def over?(board)
    return true if (won?(board) != false)
    return false if (full?(board) == false)

    board.all? do |item|
      return true if (item != " ") && (won?(board) == false)
    end
   false
  end

  def winner(board)
    if won?(board) != false
      winner_board = won?(board)
      return board[winner_board[0]]
    else
      nil
    end
  end
