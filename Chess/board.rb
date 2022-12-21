
require_relative 'piece'

class Board


    def initialize
        @grid = Array.new(8){Array.new(8){nil}}
        (0..7).each do |row|
            (0..7).each do |col|
                if row < 2 || row > 5
                    @grid[row][col] = Piece.new
                end
            end
        end
    end
    
    def [](pos)
        r, c = pos
        @grid[r][c]
    end

    def []= (pos, value)
        r, c = pos
        @grid[r][c] = value
    end

    def move_piece(start_pos, end_pos)
        raise "no piece there" if self[start_pos] == nil
        row, col = end_pos
        raise "can't move there you dumbass" if (row > 7 || col > 7) || (row < 0 || col < 0) || self[end_pos] != nil
        self[end_pos] = self[start_pos]
        self[start_pos] = nil
    end
    
    
end


