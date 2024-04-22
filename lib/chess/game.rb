# frozen_string_literal: true

module Chess
  class Game
    attr_reader :board
    attr_accessor :current_player

    def initialize(player, board)
      @current_player = player
      @board = board
    end

    def legal_moves_for_piece(pos)
      return [] if board.empty?(pos) || board[pos].color != current_player

      piece = board[pos]
      piece.get_moves(pos, board).select { |move| move.legal?(board) }
    end

    def all_legal_moves_for(player)
      board.piece_positions_for(player).flat_map { |pos| legal_moves_for_piece(pos) }
    end

    def game_over?(player)
      all_legal_moves_for(player).empty?
    end

    def make_move(move)
      board.en_passant_pos = nil
      move.execute(board)
      self.current_player = Player.opponent(current_player)
    end
  end
end
