# frozen_string_literal: true

module Chess
  class Move
    attr_reader :from_pos, :to_pos

    def initialize(from_pos, to_pos)
      @from_pos = from_pos
      @to_pos = to_pos
    end

    def legal?(board)
      board_copy = board.copy
      player = board[from_pos].color
      execute(board_copy)
      !board_copy.in_check?(player)
    end
  end
end
