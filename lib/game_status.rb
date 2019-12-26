# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  if board.include?("X") || board.include?("O")
    WIN_COMBINATIONS.each do |win_combo|    #sets each variable in WIN_COMBINATIONS to a single variable
      win_index_1=win_combo[0]
      win_index_2=win_combo[1]
      win_index_3=win_combo[2]
      pos_1=board[win_index_1]
      pos_2=board[win_index_2]
      pos_3=board[win_index_3]
      if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1=="O" && pos_2=="O" && pos_3=="O")
        return win_combo
      else
        count=0
        board.each do |position|
          if position==" "
            count+=1
          end
        end
        if count==board.length()
          return false
        end
      end
    end
  else
    return false
  end
end
