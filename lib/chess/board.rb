# frozen_string_literal: true

module Chess
  class Board
    def initialize
      @pieces = Array.new(8) { Array.new(8) }
    end

    def self.fresh
      board = new
      board.add_start_pieces
      board
    end

    def copy
      new_board = self.class.new

      piece_positions.each { |pos| new_board[pos] = self[pos].copy }
      new_board
    end

    # usage:
    # board[row, column] where row & column are integers
    # board[pos] where pos is a Position object
    def [](*args)
      if args.length == 1
        @pieces[args[0].row][args[0].column]
      else
        @pieces[args[0]][args[1]]
      end
    end

    def []=(*args)
      if args.length == 2
        @pieces[args[0].row][args[0].column] = args[1]
      else
        @pieces[args[0]][args[1]] = args[2]
      end
    end

    def inside?(position)
      position.row.between?(0, 7) && position.column.between?(0, 7)
    end

    def empty?(position)
      self[position].nil?
    end

    def add_start_pieces
      pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

      pieces.each_with_index do |piece, column|
        self[0, column] = piece.new(Player::BLACK)
        self[7, column] = piece.new(Player::WHITE)
        self[1, column] = Pawn.new(Player::BLACK)
        self[6, column] = Pawn.new(Player::WHITE)
      end
    end

    def piece_positions
      (0..7).each_with_object([]) do |row, positions|
        (0..7).each do |column|
          pos = Position.new(row, column)
          positions << pos unless empty?(pos)
        end
      end
    end
  end
end
