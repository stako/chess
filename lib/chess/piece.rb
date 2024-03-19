# frozen_string_literal: true

module Chess
  module Piece
    attr_reader :team, :move_list
    attr_accessor :position

    def initialize(team, position)
      @team = team
      @position = position
      @move_list = []
    end

    def build_moves_dir(board, directions)
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

    def build_moves_dest(board, destinations)
      list = []
      destinations.each do |dx, dy|
        dest_x = @position[0] + dx
        dest_y = @position[1] + dy
        next if dest_x > 7 || dest_y > 7

        dest_piece = board[dest_x][dest_y]

        list << [dest_x, dest_y] unless dest_piece&.team == @team
      end
      list
    end
  end
end
