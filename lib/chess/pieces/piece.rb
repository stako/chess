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

    def can_capture_type?(from, board, piece_type)
      get_moves(from, board).any? { |move| board[move.to_pos].is_a?(piece_type) }
    end

    def positions_in_dir(from, board, direction)
      positions = []
      pos = from + direction

      while board.inside?(pos) && board.empty?(pos)
        positions << pos
        pos += direction
      end

      positions << pos if board.inside?(pos) && board[pos].color != color
      positions
    end

    def positions_in_dirs(from, board, directions)
      directions.flat_map { |dir| positions_in_dir(from, board, dir) }
    end
  end
end
