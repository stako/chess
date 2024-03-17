# frozen_string_literal: true

module Chess
  class Game
    attr_reader :board

    def initialize
      @board = Board.new
    end
  end
end
