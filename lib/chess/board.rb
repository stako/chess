# frozen_string_literal: false

module Chess
  module Board
    attr_reader :board

    def print_board(selected_piece = nil)
      file_text = "  a b c d e f g h\n"
      display = file_text.dup
      (0..7).reverse_each do |rank|
        display << "#{rank + 1} "
        8.times do |file|
          piece = @board[file][rank]&.to_s || EMPTY
          display << color(piece, file, rank, selected_piece&.move_list)
        end
        display << " #{rank + 1}\n"
      end
      display << file_text
      puts display
    end

    def color(piece, file, rank, move_list)
      highlight = move_list&.include?([file, rank])
      alt = (file.odd? && rank.even?) || (file.even? && rank.odd?)

      if highlight
        alt ? piece.on_cyan : piece.on_blue
      else
        alt ? piece.on_grey : piece
      end
    end
  end
end
