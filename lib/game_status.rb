# frozen_string_literal: true

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == ' ')
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]].freeze

def won?(board)
  won = false
  WIN_COMBINATIONS.each do |combination|
    player_character = board[combination[0]]
    status = (board[combination[0]] == board[combination[1]]) && (board[combination[2]] == board[combination[1]])
    won = true if status && (%w[X O].include? player_character)

    return combination if won
  end

  true if board.any? { |val| val == '' }

  false
end

def full?(board)
  return false if (board.any? { |val| (val == '' || val == ' ') })
  return true if draw?(board)

  false
end

def draw?(board)
  WIN_COMBINATIONS.each do |combination|
    player_character = board[combination[0]]
    status = (board[combination[0]] == board[combination[1]]) && (board[combination[2]] == board[combination[1]])
    return false if status && (%w[X O].include? player_character)
  end

  return true if board.none? { |val| val == '' }

  false
end

def over?(board)
    won?(board) || full?(board)
end

def winner(board)
  winning_combination = won?(board)
  return nil if winning_combination.class == false.class
  board[winning_combination[0]]
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
