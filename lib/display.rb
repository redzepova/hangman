module Display
    def select_game_type_display
       puts "Would you like to start a new game, or load a saved game? \n
        1 - Start Game    2 - Load Game"
    end

    def game_instructions(type)
        case type
        when "round"
            "Make your guess by typing a letter and pressing enter. Type SAVE to save."
        when "save"
            "Type a name to save your game"
        when "load"
            "Type a name and press enter to load your game"
        else
            "Error. Please check your entry and try again."
        end
    end

    def display_guesses(array)
        puts "#{array.join(" ")}"
    end

end