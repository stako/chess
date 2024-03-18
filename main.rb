# frozen_string_literal: true

require_relative "lib/chess"

game = Chess.new

puts game.print_board(game.board[1][7])
