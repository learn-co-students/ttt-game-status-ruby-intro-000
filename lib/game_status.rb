# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def won?(board)
  spotIndx = [0,1,2,3,4,5,6,7,8,9].select do |spot|
    position_taken?(board, spot)
  end

  if spotIndx==[]
    winingCombo = nil
  else
    winingCombo = WIN_COMBINATIONS.detect do |oneCombo|

      onlyX=oneCombo.all? do |single|
        spotIndx.include?(single) && board[single]=="X"
      end

      onlyO=oneCombo.all? do |single|
        spotIndx.include?(single) && board[single]=="O"
      end

      [onlyX, onlyO].detect{|i| i}

    end
  end

  if !(winingCombo.nil? || winingCombo == [])
    winingCombo
  else
    false
  end
end

def full?(board)
  board.all? do |spot|
    spot == "X" || spot == "O"
  end
end

def draw?(board)
  if !!won?(board)
    false
  else
    full?(board)
  end
end

def over?(board)
  !!won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if !!won?(board)
    board[won?(board)[0]]
  else 
    nil
  end
end
