# frozen_string_literal: true

module Chess
  class Bishop < Piece
    DIRECTIONS = [
      Direction::NORTHEAST,
      Direction::NORTHWEST,
      Direction::SOUTHEAST,
      Direction::SOUTHWEST
    ].freeze

    def get_moves(from, board)
      positions_in_dirs(from, board, DIRECTIONS).map { |to| NormalMove.new(from, to) }
    end

    def to_s
      color == Player::WHITE ? "\u2657 " : "\u265D "
    end
  end
end
