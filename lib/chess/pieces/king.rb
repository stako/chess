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
      moves = move_positions(from, board).map { |to| NormalMove.new(from, to) }
      moves << Castle.new(from, King) if can_castle_ks?(from, board)
      moves << Castle.new(from, Queen) if can_castle_qs?(from, board)
      moves
    end

    def move_positions(from, board)
      DIRECTIONS.each_with_object([]) do |dir, positions|
        pos = from + dir
        positions << pos if board.inside?(pos) && (board.empty?(pos) || (board[pos].color != color))
      end
    end

    def unmoved?(pos, board)
      return false if board.empty?(pos)

      !board[pos].has_moved
    end

    def all_empty?(positions, board)
      positions.all? { |pos| board.empty?(pos) }
    end

    def can_castle_ks?(from, board)
      return false if has_moved

      rook_pos = Position.new(from.row, 7)
      intermediates = [Position.new(from.row, 5), Position.new(from.row, 6)]

      unmoved?(rook_pos, board) && all_empty?(intermediates, board)
    end

    def can_castle_qs?(from, board)
      return false if has_moved

      rook_pos = Position.new(from.row, 0)
      intermediates = [Position.new(from.row, 3), Position.new(from.row, 2), Position.new(from.row, 1)]

      unmoved?(rook_pos, board) && all_empty?(intermediates, board)
    end

    def can_capture_type?(from, board, piece_type)
      moves = move_positions(from, board).map { |to| NormalMove.new(from, to) }
      moves.any? { |move| board[move.to_pos].is_a?(piece_type) }
    end

    def to_s
      color == Player::WHITE ? "\u2654 " : "\u265A "
    end
  end
end
