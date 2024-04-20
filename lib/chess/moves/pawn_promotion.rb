# frozen_string_literal: true

module Chess
  class PawnPromotion < Move
    attr_reader :type

    def initialize(from_pos, to_pos, type)
      super(from_pos, to_pos)
      @type = type
    end

    def execute(board)
      pawn = board[from_pos]
      board[from_pos] = nil

      new_piece = type.new(pawn.color)
      new_piece.has_moved = true
      board[to_pos] = new_piece
      board.en_passant_pos = nil
    end
  end
end
