# frozen_string_literal: true

module Chess
  class Queen < Piece
    DIRECTIONS = [
      Direction::NORTH,
      Direction::EAST,
      Direction::SOUTH,
      Direction::WEST,
      Direction::NORTHEAST,
      Direction::NORTHWEST,
      Direction::SOUTHEAST,
      Direction::SOUTHWEST
    ].freeze

    def get_moves(from, board)
      positions_in_dirs(from, board, DIRECTIONS).map { |to| NormalMove.new(from, to) }
    end

    def to_s
      color == Player::WHITE ? "\u2655 " : "\u265B "
    end
  end
end
