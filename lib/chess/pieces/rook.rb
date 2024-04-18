# frozen_string_literal: true

module Chess
  class Rook < Piece
    DIRECTIONS = [
      Direction::NORTH,
      Direction::EAST,
      Direction::SOUTH,
      Direction::WEST
    ].freeze

    def get_moves(from, board)
      positions_in_dirs(from, board, DIRECTIONS).map { |to| NormalMove.new(from, to) }
    end
  end
end
