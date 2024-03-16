# frozen_string_literal: true

module Chess
  class Board
    def initialize
      @board = Array.new(8) { Array.new(8) }
    end

    def [](index)
      @board[index]
    end

    def print
      puts "foo"
    end
  end
end
