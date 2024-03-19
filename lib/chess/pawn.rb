# frozen_string_literal: true

module Chess
  class Pawn
    include Piece

    def to_s
      @team == WHITE ? "\u2659 " : "\u265f "
    end

    def update_move_list
      destinations = @team == WHITE ? [[-1, 1], [1, 1]] : [[-1, -1], [1, -1]]
      @move_list = build_moves_dest(destinations)
    end
  end
end
