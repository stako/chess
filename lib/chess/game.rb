# frozen_string_literal: true

module Chess
  class Game
    include Board
    attr_reader :player

    def initialize
      @board = Array.new(8) { Array.new(8) }
      @player = WHITE
      initialize_pieces
      update_moves
    end

    def add_piece(type, team, file, rank)
      @board[file][rank] = type.new(@board, team, [file, rank])
    end

    def initialize_pieces
      add_piece(Rook, WHITE, 0, 0)
      add_piece(Rook, WHITE, 7, 0)
      add_piece(Knight, WHITE, 1, 0)
      add_piece(Knight, WHITE, 6, 0)
      add_piece(Bishop, WHITE, 2, 0)
      add_piece(Bishop, WHITE, 5, 0)
      add_piece(Queen, WHITE, 3, 0)
      add_piece(King, WHITE, 4, 0)

      add_piece(Rook, BLACK, 0, 7)
      add_piece(Rook, BLACK, 7, 7)
      add_piece(Knight, BLACK, 1, 7)
      add_piece(Knight, BLACK, 6, 7)
      add_piece(Bishop, BLACK, 2, 7)
      add_piece(Bishop, BLACK, 5, 7)
      add_piece(Queen, BLACK, 3, 7)
      add_piece(King, BLACK, 4, 7)

      8.times do |x|
        add_piece(Pawn, WHITE, x, 1)
        add_piece(Pawn, BLACK, x, 6)
      end
    end

    def update_moves
      @board.each do |file|
        file.each { |piece| piece&.update_move_list }
      end
    end

    def move_piece(piece, dest)
      return false unless piece&.move_list&.include?(dest)

      piece.pickup
      piece.place(dest)
      update_moves
      true
    end

    def switch_players
      @player = @player == WHITE ? BLACK : WHITE
    end

    def convert(notation)
      file = notation[0].downcase.ord - 97
      return nil unless file.between?(0, 7)

      rank = notation[1].to_i - 1
      return nil unless rank.between?(0, 7)

      [file, rank]
    end
  end
end
