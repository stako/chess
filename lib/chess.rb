# frozen_string_literal: true

require "colorize"
require_relative "chess/board"
require_relative "chess/game"
require_relative "chess/piece"
require_relative "chess/rook"
require_relative "chess/knight"
require_relative "chess/bishop"
require_relative "chess/queen"
require_relative "chess/king"
require_relative "chess/pawn"

module Chess
  WHITE = "White"
  BLACK = "Black"
  EMPTY = "  "

  def self.new
    Game.new
  end
end
