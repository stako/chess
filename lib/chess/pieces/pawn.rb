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

    def can_move_to?(pos, board)
      board.inside?(pos) && board.empty?(pos)
    end

    def can_capture_at?(pos, board)
      return false if !board.inside?(pos) || board.empty?(pos)

      board[pos].color != color
    end

    def forward_moves(from, board)
      array = []
      one_move_pos = from + @forward
      if can_move_to?(one_move_pos, board)
        array << NormalMove.new(from, one_move_pos)

        two_moves_pos = one_move_pos + @forward
        array << NormalMove.new(from, two_moves_pos) if !has_moved && can_move_to?(two_moves_pos, board)
      end
      array
    end

    def diagonal_moves(from, board)
      array = []
      [Direction::WEST, Direction::EAST].each do |dir|
        to = from + @forward + dir
        array << NormalMove.new(from, to) if can_capture_at?(to, board)
      end
      array
    end
  end
end