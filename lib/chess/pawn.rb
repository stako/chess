# frozen_string_literal: true

module Chess
  class Pawn < Piece
    def initialize(board, team, position)
      super
      @has_moved = false
    end

    def to_s
      @team == WHITE ? "\u2659 " : "\u265f "
    end

    def place(destination)
      super
      @has_moved = true
    end

    def update_move_list
      destinations = @team == WHITE ? [[-1, 1], [1, 1]] : [[-1, -1], [1, -1]]
      @move_list = build_moves_dest(destinations)

      directions = @team == WHITE ? [[0, 1]] : [[0, -1]]
      @move_list += build_moves_dir(directions)
    end

    def build_moves_dir(directions)
      list = []
      directions.each do |dx, dy|
        dest_x = @position[0] + dx
        dest_y = @position[1] + dy
        distance = 1
        loop do
          break unless dest_x.between?(0, 7) && dest_y.between?(0, 7)

          dest_piece = @board[dest_x][dest_y]
          break if dest_piece || distance > (@has_moved ? 1 : 2)

          list << [dest_x, dest_y]

          dest_x += dx
          dest_y += dy
          distance += 1
        end
      end
      list
    end

    def build_moves_dest(destinations)
      list = []
      destinations.each do |dx, dy|
        dest_x = @position[0] + dx
        dest_y = @position[1] + dy
        next unless dest_x.between?(0, 7) && dest_y.between?(0, 7)

        dest_piece = @board[dest_x][dest_y]

        list << [dest_x, dest_y] if dest_piece && dest_piece.team != @team
      end
      list
    end
  end
end
