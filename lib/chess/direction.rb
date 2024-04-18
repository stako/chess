# frozen_string_literal: true

module Chess
  Direction = Data.define(:row_delta, :column_delta) do
    # 'other' must be a Direction object
    def +(other)
      self.class.new(row_delta + other.row_delta, column_delta + other.column_delta)
    end

    # 'other' must be an integer
    def *(other)
      self.class.new(row_delta * other, column_delta * other)
    end
  end

  class Direction
    NORTH = new(-1, 0)
    EAST  = new(0, 1)
    SOUTH = new(1, 0)
    WEST  = new(0, -1)

    NORTHEAST = NORTH + EAST
    NORTHWEST = NORTH + WEST
    SOUTHEAST = SOUTH + EAST
    SOUTHWEST = SOUTH + WEST
  end
end
