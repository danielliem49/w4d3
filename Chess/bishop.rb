require_relative "piece"
require_relative "slideable"

class Bishop < Piece
include Slideable

    def initialize(color, board, pos)
        super
    end

    def symbol
        "♗"
    end

    private

    def move_dirs
        diagonal_dirs
    end
end