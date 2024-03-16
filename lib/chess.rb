# frozen_string_literal: true

require_relative "chess/game"
require_relative "chess/board"

module Chess
  def self.new
    Game.new
  end
end
