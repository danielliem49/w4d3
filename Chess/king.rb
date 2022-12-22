require_relative "piece"
require_relative "stepable"

class King < Piece 
include Stepable

    attr_reader :color

    def initialize(color, board, pos)
        super
    end

    def symbol
        "♔"
    end

    protected
    def move_diffs
        [[1,1],[1,-1],[-1,1],[-1,-1],[0,1],[0,-1],[1,0],[-1,0]]
    end

end