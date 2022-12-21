
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
    
end

