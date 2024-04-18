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
      array = []
      DIRECTIONS.each do |dir|
        pos = from + dir
        next unless board.inside?(pos)

        array << pos if board.empty?(pos) || (board[pos].color != color)
      end
      array
    end
  end
end
