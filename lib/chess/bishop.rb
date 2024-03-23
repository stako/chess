# frozen_string_literal: true

module Chess
  class Bishop < Piece
    def to_s
      @team == WHITE ? "\u2657 " : "\u265d "
    end

    def update_move_list
      directions = [[1, 1], [1, -1], [-1, 1], [-1, -1]]
      @move_list = build_moves_dir(directions)
    end
  end
end
