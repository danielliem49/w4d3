require 'colorize'
require 'cursor'
require 'board'


class Display

    def initialize(board)
        @board = board
        @cursor = cursor
    end

    def render
        board.grid.each do |row|
            row_arr = []
            row.each do |ele|
                row_arr << ele.symbol
            end
            p row_arr
        end    
    end

end