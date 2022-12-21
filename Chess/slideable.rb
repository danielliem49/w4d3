module Slideable

    HORIZONTAL_DIRS = [[0,1],[0,-1],[1,0],[-1,0]].freeze
    DIAGONAL_DIRS = [[1,1],[1,-1],[-1,1],[-1,-1]].freeze

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves(move_directions)
        result = []
        move_directions.each do |increment|
            result << grow_unblocked_moves_in_dir(increment)
        end
        result
    end

    private
    
    # def move_dirs

    # end


    def grow_unblocked_moves_in_dir(dx,dy)
        temp = []
        row, col = self.pos
        until ((row > 7 || col > 7) || (row < 0 || col < 0))
            row += dx
            col += dy
            temp << [row, col]
        end

        result = []
        temp.each do |temp_pos|
            result << temp_pos #nil placeholder for Nullclass singleton
            if board[temp_pos] != nil && self.color == board[temp_pos].color
                return result[0...-1]
            elsif board[temp_pos] != nil && self.color != board[temp_pos].color
                return result
            end
        end
        result
    end
end