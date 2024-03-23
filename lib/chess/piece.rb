# frozen_string_literal: true

module Chess
  class Piece
    attr_reader :team, :move_list
    attr_accessor :position

    def initialize(board, team, position)
      @board = board
      @team = team
      @position = position
      @move_list = []
    end

    def build_moves_dir(directions)
      list = []
      directions.each do |dx, dy|
        dest_x = @position[0] + dx
        dest_y = @position[1] + dy
        loop do
          break if dest_x > 7 || dest_y > 7

          dest_piece = @board[dest_x][dest_y]
          list << [dest_x, dest_y] unless dest_piece&.team == @team
          break if dest_piece

          dest_x += dx
          dest_y += dy
        end
      end
      list
    end

    def build_moves_dest(destinations)
      list = []
      destinations.each do |dx, dy|
        dest_x = @position[0] + dx
        dest_y = @position[1] + dy
        next if dest_x > 7 || dest_y > 7

        dest_piece = @board[dest_x][dest_y]

        list << [dest_x, dest_y] unless dest_piece&.team == @team
      end
      list
    end

    def pickup
      @board[@position[0]][@position[1]] = nil
      @position = nil
    end

    def place(destination)
      @position = destination
      @board[@position[0]][@position[1]] = self
    end
  end
end
