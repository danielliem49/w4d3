module Stepable
    
    def moves(move_differ)
        temp = []
        row, col = self.pos
        move_differ.each do |increment|
        x = increment[0] + row
        y = increment[1] + col
            unless ((x > 7 || y > 7) || (x < 0 || y < 0))
                temp << [x, y]
            end
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