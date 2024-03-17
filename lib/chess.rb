# frozen_string_literal: true

require "colorize"
require_relative "chess/game"
require_relative "chess/board"

module Chess
  WHITE = 0
  BLACK = 1
  EMPTY = "  "

  def self.new
    Game.new
  end
end
