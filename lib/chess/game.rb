# frozen_string_literal: true

module Chess
  class Game
    include Board

    def initialize
      @board = Array.new(8) { Array.new(8) }
      initialize_pieces
      initialize_moves
    end

    def place_piece(type, color, file, rank)
      @board[file][rank] = type.new(color, [file, rank])
    end

    def initialize_pieces
      place_piece(Rook, WHITE, 0, 0)
      place_piece(Rook, WHITE, 7, 0)
      place_piece(Knight, WHITE, 1, 0)
      place_piece(Knight, WHITE, 6, 0)
      place_piece(Bishop, WHITE, 2, 0)
      place_piece(Bishop, WHITE, 5, 0)
      place_piece(Queen, WHITE, 3, 0)
      place_piece(King, WHITE, 4, 0)
      8.times { |x| place_piece(Pawn, WHITE, x, 1) }

      place_piece(Rook, BLACK, 0, 7)
      place_piece(Rook, BLACK, 7, 7)
      place_piece(Knight, BLACK, 1, 7)
      place_piece(Knight, BLACK, 6, 7)
      place_piece(Bishop, BLACK, 2, 7)
      place_piece(Bishop, BLACK, 5, 7)
      place_piece(Queen, BLACK, 3, 7)
      place_piece(King, BLACK, 4, 7)
      8.times { |x| place_piece(Pawn, BLACK, x, 6) }
    end

    def initialize_moves
      [0, 1, 6, 7].each do |rank|
        7.times do |file|
          @board[file][rank].update_move_list(@board)
        end
      end
    end
  end
end
