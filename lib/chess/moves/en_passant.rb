# frozen_string_literal: true

module Chess
  class EnPassant < Move
    def execute(board)
      NormalMove.new(from_pos, to_pos).execute(board)
      capture_pos = Position.new(from_pos.row, to_pos.column)
      board[capture_pos] = nil
    end
  end
end
