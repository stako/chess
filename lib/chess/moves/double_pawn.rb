# frozen_string_literal: true

module Chess
  class DoublePawn < Move
    attr_reader :skipped_pos

    def initialize(from_pos, to_pos)
      super
      @skipped_pos = Position.new((from_pos.row + to_pos.row) / 2, from_pos.column)
    end

    def execute(board)
      Chess::NormalMove.new(from_pos, to_pos).execute(board)
    end
  end
end
