# frozen_string_literal: true

module Chess
  class Castle < Move
    attr_reader :king_move_dir, :rook_from_pos, :rook_to_pos

    def initialize(from_pos, side)
      super(from_pos, nil)

      if side == King
        @king_move_dir = Direction::EAST
        @to_pos = Position.new(from_pos.row, 6)
        @rook_from_pos = Position.new(from_pos.row, 7)
        @rook_to_pos = Position.new(from_pos.row, 5)
      elsif side == Queen
        @king_move_dir = Direction::WEST
        @to_pos = Position.new(from_pos.row, 2)
        @rook_from_pos = Position.new(from_pos.row, 0)
        @rook_to_pos = Position.new(from_pos.row, 3)
      end
    end

    def execute(board)
      NormalMove.new(from_pos, to_pos).execute(board)
      NormalMove.new(rook_from_pos, rook_to_pos).execute(board)
    end

    def legal?(board)
      player = board[from_pos].color
      return false if board.in_check?(player)

      (1..2).each { |i| return false unless NormalMove.new(from_pos, from_pos + (king_move_dir * i)).legal?(board) }
      true
    end
  end
end
