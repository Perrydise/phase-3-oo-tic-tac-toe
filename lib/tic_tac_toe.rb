class TicTacToe 
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [6,4,2],
        [8,4,0]
    ]

    attr_accessor :board

    def initialize()
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display_board
        count = 1
        string = ""
       for i in @board
        string += " " + i + " "
        # puts count %3
        # puts count
        if count %3 != 0 
            string += "|"
        end
        if count %3 == 0 && count != @board.length
            string += "\n-----------\n"
        end
        count += 1  
       end  
       print string           
    
    # board_array = @board.each_slice(3) {|e| print e.join(" | ")}

    # board_arrays = @board.each_slice(3){|e| print e}

    # print board_arrays

    # board_arrays.map {|element| element.join(" | ")}

    # print board_arrays

    end

    def input_to_index(user_input)
       correct_input = user_input.to_i
        # puts correct_input
        correct_input - 1 
    end

    def move(position, token) 
        @board[position] = token
    end

    def position_taken?(position)
        spot_check = @board[position]
        if spot_check == "X" || spot_check == "O"
            return true
        else
            return false
        end
    end

    def valid_move?(position)
        if position.between?(0,8) 
        !position_taken?(position)
        end
    end

    def turn_count
     x_count = @board.count("X")
     o_count = @board.count("O")
     return x_count + o_count
    end

    def current_player
    x_count = @board.count("X")
    o_count = @board.count("O")
    if x_count > o_count
        return ("O")
    else 
        return ("X")
    end
    end

    def turn 
        puts "What position would you like to move to?"
        position = gets
        correct_input = input_to_index(position)
    if valid_move?(correct_input) == true
        token = current_player()  
            move(correct_input, token)
            return display_board()
    else
       return turn()
        end
    end

    def won?
        for i in WIN_COMBINATIONS
            # puts i[0]
            # puts i[1]
            # puts i[2]
            # puts @board[i[0]]
            num1 = @board[i[0]]
            num2 = @board[i[1]]
            num3 = @board[i[2]]
            # puts "----"
            # puts num1
            # puts num2
            # puts num3
            # puts "----"
            if num1 == num2 && num2 == num3 && num1 == num3
                puts i
                return i     
            end
        end
        return false
    end

    def full?
    x_count = @board.count("X")
    o_count = @board.count("O")
    if x_count + o_count == @board.length
        return true
    end
    end

    def draw?
        if !won?() && full?() == true
            return true
        end
    end

    def over?
        if won?() || full?()
            return true
        end
    end

    def winner
       letter = won?()
        letter[0]
        @board[letter[0]]
    end

end