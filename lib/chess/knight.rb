# frozen_string_literal: true

module Chess
  class Knight
    include Piece

    def to_s
      @team == WHITE ? "\u2658 " : "\u265e "
    end

    def update_move_list
      destinations = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
      @move_list = build_moves_dest(destinations)
    end
  end
end
