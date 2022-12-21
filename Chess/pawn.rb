require_relative "piece"

class Pawn < Piece 

    def initialize(color, board, pos)
        super
    end

    def symbol
        :P
    end

    def moves
        result = []
        temp = [forward_dir] + [forward_steps] + side_attacks
        temp.each do |temp_pos|
            row = temp_pos[0]
            col = temp_pos[1]
            unless ((row > 7 || col > 7) || (row < 0 || col < 0))
                result << temp_pos
            end
        end
        result
    end

    private

    def at_start_row?
# return boolean if pawn is at starting pos
        if self.color == "black" && self.pos[0] == 1
            return true
        elsif self.color == "white" && self.pos[0] == 6
            return true
        end
        false
    end

    def forward_dir #returns 1 or -1 added to pos
        if self.color == "black" && board([self.pos[0], self.pos[1] + 1]).is_a?(NullPiece)
            return [self.pos[0], self.pos[1] + 1] 
        elsif self.color == "white" && board([self.pos[0], self.pos[1] - 1]).is_a?(NullPiece)
            return [self.pos[0], self.pos[1] - 1]
        end
    end

    def forward_steps
        if at_start_row? && self.color == "black" && board([forward_dir[0], forward_dir[1] + 1]).is_a?(NullPiece)
            return [forward_dir[0], forward_dir[1] + 1]
        elsif at_start_row? && self.color == "white" && board([forward_dir[0], forward_dir[1] - 1]).is_a?(NullPiece)
            return [forward_dir[0], forward_dir[1] - 1]
        end
    end

    def side_attacks 
        
        if self.color == "black"
            right_attack = [self.pos[0] + 1, self.pos[0] + 1]
            left_attack = [self.pos[0] - 1, self.pos[0] + 1]
        else
            right_attack = [self.pos[0] + 1, self.pos[0] - 1]
            left_attack = [self.pos[0] - 1, self.pos[0] - 1]
        end
        attacks = [right_attack, left_attack]

        valid_attacks = []
        attacks.each do |attack|
            if !board(attack).is_a?(NullPiece) && board(attack).color != self.color
                valid_attacks << attack
            end
        end
        valid_attacks
    end
    
    
    
    
end
