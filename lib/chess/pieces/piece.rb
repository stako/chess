# frozen_string_literal: true

module Chess
  class Piece
    attr_reader :color
    attr_accessor :has_moved

    def initialize(color)
      @color = color
    end

    def copy
      new_piece = self.class.new(color)
      new_piece.has_moved = has_moved
      new_piece
    end
  end
end
