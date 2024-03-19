# frozen_string_literal: true

module Chess
  class Game
    include Board

    def initialize
      @board = Array.new(8) { Array.new(8) }
      @pieces = []
      @player = WHITE
      initialize_pieces
      update_moves
    end

    def place_piece(type, team, file, rank)
      @pieces << @board[file][rank] = type.new(team, [file, rank])
    end

    def initialize_pieces
      place_piece(Rook, WHITE, 0, 0)
      place_piece(Rook, WHITE, 7, 0)
      place_piece(Knight, WHITE, 1, 0)
      place_piece(Knight, WHITE, 6, 0)
      place_piece(Bishop, WHITE, 2, 0)
      place_piece(Bishop, WHITE, 5, 0)
      place_piece(Queen, WHITE, 3, 0)
      place_piece(King, WHITE, 4, 0)
      8.times { |x| place_piece(Pawn, WHITE, x, 1) }

      place_piece(Rook, BLACK, 0, 7)
      place_piece(Rook, BLACK, 7, 7)
      place_piece(Knight, BLACK, 1, 7)
      place_piece(Knight, BLACK, 6, 7)
      place_piece(Bishop, BLACK, 2, 7)
      place_piece(Bishop, BLACK, 5, 7)
      place_piece(Queen, BLACK, 3, 7)
      place_piece(King, BLACK, 4, 7)
      8.times { |x| place_piece(Pawn, BLACK, x, 6) }
    end

    def update_moves
      @pieces.each { |piece| piece.update_move_list(@board) }
    end

    def move_piece(piece, dest)
      return false if piece.nil? || !piece.move_list.include?(dest)

      @pieces.delete(@board[dest[0]][dest[1]])

      @board[piece.position[0]][piece.position[1]] = nil
      @board[dest[0]][dest[1]] = piece
      piece.position = dest
      true
    end

    def switch_players
      @player = @player == WHITE ? BLACK : WHITE
    end
  end
end
