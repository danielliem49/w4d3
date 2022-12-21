require_relative "piece"
require "singleton"

class NullPiece < Piece 

include Singleton

    def initialize
        @color = "neutral"
        @symbol = " "
        @pos = []
    end

    def symbol
        @symbol
    end

    # def moves
    #     result = []
    #     temp = [forward_dir] + [forward_steps] + side_attacks
    #     temp.each do |temp_pos|
    #         row = temp_pos[0]
    #         col = temp_pos[1]
    #         unless ((row > 7 || col > 7) || (row < 0 || col < 0))
    #             result << temp_pos
    #         end
    #     end
    #     result
    # end
    
end
