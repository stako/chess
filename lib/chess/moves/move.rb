# frozen_string_literal: true

module Chess
  class Move
    attr_reader :from_pos, :to_pos

    def initialize(from_pos, to_pos)
      @from_pos = from_pos
      @to_pos = to_pos
    end
  end
end
