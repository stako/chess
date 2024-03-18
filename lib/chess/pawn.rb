# frozen_string_literal: true

module Chess
  class Pawn
    include Piece

    def to_s
      @team == WHITE ? "\u2659 " : "\u265f "
    end

    def update_move_list(board)
      destinations = @team == WHITE ? [[-1, 1], [1, 1]] : [[-1, -1], [1, -1]]
      @move_list = build_moves_dest(board, destinations)
    end
  end
end
