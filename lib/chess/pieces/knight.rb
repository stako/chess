# frozen_string_literal: true

module Chess
  class Knight < Piece
    def get_moves(from, board)
      move_positions(from, board).map { |to| NormalMove.new(from, to) }
    end

    def potential_move_positions(from)
      array = []
      [Direction::NORTH, Direction::SOUTH].each do |v_dir|
        [Direction::EAST, Direction::WEST].each do |h_dir|
          array << (from + (v_dir * 2) + h_dir)
          array << (from + (h_dir * 2) + v_dir)
        end
      end
      array
    end

    def move_positions(from, board)
      potential_move_positions(from).select do |pos|
        board.inside?(pos) && (board.empty?(pos) || board[pos].color != color)
      end
    end
  end
end
