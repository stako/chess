# frozen_string_literal: true

module Chess
  class Board
    def initialize
      @pieces = Array.new(8) { Array.new(8) }
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
  end
end
