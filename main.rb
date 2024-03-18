# frozen_string_literal: true

require_relative "lib/chess"

@game = Chess.new

def clear_print
  system "clear"
  @game.print_board
end

clear_print
