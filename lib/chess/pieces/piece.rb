# frozen_string_literal: true

module Chess
  class Piece
    attr_reader :color
    attr_accessor :has_moved

    def initialize(color)
      @color = color
    end

    def copy
      new_piece = self.class.new(color)
      new_piece.has_moved = has_moved
      new_piece
    end

    def positions_in_dir(from, board, direction)
      array = []
      pos = from + direction

      while board.inside?(pos) && board.empty?(pos)
        array << pos
        pos += direction
      end

      array << pos if board.inside?(pos) && board[pos].color != color
      array
    end

    def positions_in_dirs(from, board, directions)
      directions.flat_map { |dir| positions_in_dir(from, board, dir) }
    end
  end
end
