# frozen_string_literal: true

module Chess
  class Rook < Piece
    def to_s
      @team == WHITE ? "\u2656 " : "\u265c "
    end

    def update_move_list
      directions = [[0, 1], [1, 0], [0, -1], [-1, 0]]
      @move_list = build_moves_dir(directions)
    end
  end
end
