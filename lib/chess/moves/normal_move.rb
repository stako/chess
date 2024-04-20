# frozen_string_literal: true

module Chess
  class NormalMove < Move
    def execute(board)
      piece = board[from_pos]
      board[to_pos] = piece
      board[from_pos] = nil
      piece.has_moved = true
      board.en_passant_pos = nil
    end
  end
end
