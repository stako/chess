# frozen_string_literal: true

module Chess
  class Rook < Piece
    DIRECTIONS = [
      Direction::NORTH,
      Direction::EAST,
      Direction::SOUTH,
      Direction::WEST
    ].freeze
  end
end
