
require_relative 'piece'
require_relative 'pawn'
require_relative 'king'
require_relative 'queen'
require_relative 'nullpiece'
require_relative 'knight'
require_relative 'rook'
require_relative 'bishop'



class Board

    attr_reader :np, :grid

    def initialize
        @np = NullPiece.instance
        @grid = Array.new(8){Array.new(8){np}}
        (0..7).each do |row|
            (0..7).each do |col|
                if row == 1 
                    @grid[row][col] = Pawn.new("black", self, [row, col])
                elsif row == 6
                    @grid[row][col] = Pawn.new("white", self, [row, col])
                end

                if col == 0 || col == 7
                    if row == 0
                        @grid[row][col] = Rook.new("black", self, [row, col])
                    elsif row == 7
                        @grid[row][col] = Rook.new("white", self, [row, col])
                    end
                end

                if col == 1 || col == 6
                    if row == 0
                        @grid[row][col] = Knight.new("black", self, [row, col])
                    elsif row == 7
                        @grid[row][col] = Knight.new("white", self, [row, col])
                    end
                end

                if col == 2 || col == 5
                    if row == 0
                        @grid[row][col] = Bishop.new("black", self, [row, col])
                    elsif row == 7
                        @grid[row][col] = Bishop.new("white", self, [row, col])
                    end
                end

                if col == 3
                    if row == 0
                        @grid[row][col] = King.new("black", self, [row, col])
                    elsif row == 7
                        @grid[row][col] = King.new("white", self, [row, col])
                    end
                end

                if col == 4
                    if row == 0
                        @grid[row][col] = Queen.new("black", self, [row, col])
                    elsif row == 7
                        @grid[row][col] = Queen.new("white", self, [row, col])
                    end
                end

            end
        end
    end

    def test
        grid.each do |row|
            row_arr = []
            row.each do |ele|
                row_arr << ele.symbol
            end
            p row_arr
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
        raise "no piece there" if self[start_pos].is_a?(NullPiece)
        row, col = end_pos
        raise "can't move there you dumbass" if (row > 7 || col > 7) || (row < 0 || col < 0) || self[end_pos] != NullPiece
        self[end_pos] = self[start_pos]
        self[start_pos] = NullPiece
    end

    def valid_position?(pos)
        row,col = pos
        return false if (row > 7 || col > 7) || (row < 0 || col < 0)
        return true
    end

    def in_check?(color)
        all_opponent_moves = []
        grid.each do |row|
            row.each do |ele|
                if !ele.is_a?(NullPiece) && ele.color != color
                    all_opponent_moves << ele.moves
                end
            end
        end

        
        king_pos = []
        grid.each do |row|
            row.each do |ele|
                if ele.is_a?(King) && ele.color == color
                    king_pos = ele.pos
                end
            end
        end       

        if all_opponent_moves.include?(king_pos)
            return true
        else
            return false
        end
    end
    
        def checkmate?(color)
        all_opponent_moves = []
        grid.each do |row|
            row.each do |ele|
                if !ele.is_a?(NullPiece) && ele.color != color
                    all_opponent_moves << ele.moves
                end
            end
        end

        
        king_moves = []
        grid.each do |row|
            row.each do |ele|
                if ele.is_a?(King) && ele.color == color
                    king_moves << ele.moves
                end
            end
        end       

        if king_moves.all?{|move| all_opponent_moves.include?(move)}
            return true
        else
            return false
        end
    end

end

