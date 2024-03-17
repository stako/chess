# frozen_string_literal: true

module Chess
  module Piece
    def initialize(team, position)
      @team = team
      @position = position
      @move_list = []
    end

    def find_moves(board, directions)
      list = []
      directions.each do |dx, dy|
        dest_x = @position[0] + dx
        dest_y = @position[1] + dy
        loop do
          break if dest_x > 7 || dest_y > 7

          dest_piece = board[dest_x][dest_y]
          list << [dest_x, dest_y] unless dest_piece&.team == @team
          break if dest_piece

          dest_x += x
          dest_y += y
        end
      end
      list
    end
  end
end
