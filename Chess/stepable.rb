module Stepable
    
    def moves
        temp = []
        row, col = self.pos
        if ((row > 7 || col > 7) || (row < 0 || col < 0))
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
    end

    private
    
    # def move_diffs
        
    # end
end