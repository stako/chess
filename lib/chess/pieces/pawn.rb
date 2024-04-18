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
      moves = []
      one_move_pos = from + @forward
      if can_move_to?(one_move_pos, board)
        if one_move_pos.row.zero? || one_move_pos.row == 7
          moves += promotion_moves(from, one_move_pos)
        else
          moves << NormalMove.new(from, one_move_pos)
        end

        two_moves_pos = one_move_pos + @forward
        moves << NormalMove.new(from, two_moves_pos) if !has_moved && can_move_to?(two_moves_pos, board)
      end
      moves
    end

    def diagonal_moves(from, board)
      [Direction::WEST, Direction::EAST].each_with_object([]) do |dir, moves|
        to = from + @forward + dir
        next unless can_capture_at?(to, board)

        if to.row.zero? || to.row == 7
          promotion_moves(from, to).each { |move| moves << move }
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
