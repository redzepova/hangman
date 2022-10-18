# frozen_string_literal: true
module Display
  def select_game_type_display
    puts "Would you like to start a new game, or load a saved game? \n
        1 - Start Game    2 - Load Game"
  end

  def player_turn
    "Choose a letter."
  end

  def bad_input
    "That's not a valid entry. Try again."
  end

  def repeated_guess
    "You already guessed that letter."
  end

  def display_guesses(title, array)
    puts "#{title}: #{array.join(" ").to_s}"
  end

  def won_game_answer
    <<~HEREDOC

    CONGRATULATIONS! You win! 

    The winning word was #{@solution.join("").to_s}

    You got the answer with only #{bad_guesses.length} incorrect guesses.

    Would you like to play again?

    1 - YES  2 - NO

    HEREDOC
 end

 def lost_game_answer
    <<~HEREDOC

    Too bad. Better luck next time.

    The winnig word was #{@solution.join("").to_s}

    Would you like to play again?

    1 - YES  2 - NO

    HEREDOC
 end

end
