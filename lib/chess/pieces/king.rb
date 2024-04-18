# frozen_string_literal: true

module Chess
  class King < Piece
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
      move_positions(from, board).map { |to| NormalMove.new(from, to) }
    end

    def move_positions(from, board)
      DIRECTIONS.each_with_object([]) do |dir, positions|
        pos = from + dir
        positions << pos if board.inside?(pos) && (board.empty?(pos) || (board[pos].color != color))
      end
    end
  end
end
