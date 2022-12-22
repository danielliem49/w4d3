require 'colorize'
require_relative 'cursor'
require_relative 'board'


class Display

    attr_reader :board, :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0, 0], board)
    end

    def render
        board.grid.each do |row|
            row_arr = []
            row.each do |ele|
                if ele.pos == cursor.cursor_pos
                    row_arr << ele.symbol.blue.on_red
                else
                    row_arr << ele.symbol
                end
            end
            p row_arr
        end    
    end

end

# a = Board.new
# b = Display.new(a)
# until b.cursor.get_input
#     b.cursor.get_input
#     b.render
# end