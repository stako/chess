# frozen_string_literal: true

module Chess
  class Knight
    include Piece

    def to_s
      @team == WHITE ? "\u2658 " : "\u265e "
    end

    def update_move_list(board)
      destinations = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
      @move_list = find_moves(board, destinations)
    end

    def find_moves(board, destinations)
      list = []
      destinations.each do |dx, dy|
        dest_x = @position[0] + dx
        dest_y = @position[1] + dy
        next if dest_x > 7 || dest_y > 7

        dest_piece = board[dest_x][dest_y]

        list << [dest_x, dest_y] unless dest_piece&.team == @team
      end
      list
    end
  end
end
