# frozen_string_literal: false

module Chess
  class Board
    def initialize
      @board = Array.new(8) { Array.new(8) }
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
      return piece.on_grey if (file.odd? && rank.odd?) || (file.even? && rank.even?)

      piece
    end
  end
end
