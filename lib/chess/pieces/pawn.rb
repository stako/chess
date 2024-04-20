# frozen_string_literal: true

module Chess
  class Pawn < Piece
    def initialize(color)
      super
      @forward = (color == Player::WHITE ? Direction::NORTH : Direction::SOUTH)
    end

    def get_moves(from, board)
      forward_moves(from, board) + diagonal_moves(from, board)
    end

    def can_capture_type?(from, board, piece_type)
      diagonal_moves(from, board).any? { |move| board[move.to_pos].is_a?(piece_type) }
    end

    def can_move_to?(pos, board)
      board.inside?(pos) && board.empty?(pos)
    end

    def can_capture_at?(pos, board)
      return false if !board.inside?(pos) || board.empty?(pos)

      board[pos].color != color
    end

    def forward_moves(from, board)
      single_move_pos = from + @forward

      return [] unless can_move_to?(single_move_pos, board)

      moves = if single_move_pos.row.zero? || single_move_pos.row == 7
                promotion_moves(from, single_move_pos)
              else
                [NormalMove.new(from, single_move_pos)]
              end

      double_move_pos = single_move_pos + @forward

      return moves unless !has_moved && can_move_to?(double_move_pos, board)

      moves << DoublePawn.new(from, double_move_pos)
    end

    def diagonal_moves(from, board)
      [Direction::WEST, Direction::EAST].each_with_object([]) do |dir, moves|
        to = from + @forward + dir
        next unless can_capture_at?(to, board)

        if to.row.zero? || to.row == 7
          moves.concat(promotion_moves(from, to))
        else
          moves << NormalMove.new(from, to)
        end
      end
    end

    def promotion_moves(from, to)
      [Knight, Bishop, Rook, Queen].each_with_object([]) do |type, moves|
        moves << PawnPromotion.new(from, to, type)
      end
    end
  end
end
