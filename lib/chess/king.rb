# frozen_string_literal: true

module Chess
  class King < Piece
    def to_s
      @team == WHITE ? "\u2654 " : "\u265a "
    end

    def update_move_list
      destinations = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
      @move_list = build_moves_dest(destinations)
    end
  end
end
