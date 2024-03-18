# frozen_string_literal: false

module Chess
  class Board
    def initialize
      @board = Array.new(8) { Array.new(8) }
      place_pieces
    end

    def [](index)
      @board[index]
    end

    def to_s
      display = ""
      (0..7).reverse_each do |rank|
        8.times do |file|
          piece = @board[file][rank]&.to_s || EMPTY
          display << color(piece, file, rank)
        end
        display << "\n"
      end
      display
    end

    def color(piece, file, rank)
      return piece.on_grey if (file.odd? && rank.even?) || (file.even? && rank.odd?)

      piece
    end

    def place_piece(type, color, file, rank)
      @board[file][rank] = type.new(color, [file, rank])
    end

    def place_pieces
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
  end
end
