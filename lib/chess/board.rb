# frozen_string_literal: false

module Chess
  class Board
    def initialize
      @board = Array.new(8) { Array.new(8) }
      @highlighted_tiles = nil
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
      highlight = @highlighted_tiles&.include?([file, rank])
      alt = (file.odd? && rank.even?) || (file.even? && rank.odd?)

      if highlight
        alt ? piece.on_cyan : piece.on_blue
      else
        alt ? piece.on_grey : piece
      end
    end
  end
end
