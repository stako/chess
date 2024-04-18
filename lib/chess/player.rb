# frozen_string_literal: true

module Chess
  module Player
    WHITE = "White"
    BLACK = "Black"

    def opponent(player)
      case player
      when WHITE
        BLACK
      when BLACK
        WHITE
      end
    end
  end
end
