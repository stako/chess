# frozen_string_literal: true

module Chess
  Position = Data.define(:row, :column) do
    # 'other' must be a Direction object
    def +(other)
      self.class.new(row + other.row_delta, column + other.column_delta)
    end
  end
end
