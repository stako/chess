# frozen_string_literal: true

module Chess
  class Queen
    include Piece

    def to_s
      @team == WHITE ? "\u2655 " : "\u265b "
    end

    def update_move_list
      directions = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
      @move_list = build_moves_dir(directions)
    end
  end
end
