# frozen_string_literal: true

module Chess
  class Knight < Piece
    def get_moves(from, board)
      move_positions(from, board).map { |to| NormalMove.new(from, to) }
    end

    def potential_move_positions(from)
      [Direction::NORTH, Direction::SOUTH].each_with_object([]) do |v_dir, positions|
        [Direction::EAST, Direction::WEST].each do |h_dir|
          positions << (from + (v_dir * 2) + h_dir)
          positions << (from + (h_dir * 2) + v_dir)
        end
      end
    end

    def move_positions(from, board)
      potential_move_positions(from).select do |pos|
        board.inside?(pos) && (board.empty?(pos) || board[pos].color != color)
      end
    end

    def to_s
      color == Player::WHITE ? "\u2658 " : "\u265E "
    end
  end
end
