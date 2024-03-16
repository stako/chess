# frozen_string_literal: true

module Chess
  class Game
    attr_reader :board

    def initialize
      @board = Board.new
      # @board[4][4] = Rook.new("White", [4, 4])
    end
  end
end
