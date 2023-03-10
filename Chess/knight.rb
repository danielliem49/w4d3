require_relative "piece"
require_relative "stepable"

class Knight < Piece 
include Stepable

    def initialize(color, board, pos)
        super
    end

    def symbol
        "♘"
    end

    protected
    def move_diffs
        [[-1,2],[-1,-2],[1,2],[1,-2],[2,1],[2,-1],[-2,1],[-2,1]]
    end

end