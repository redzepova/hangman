# frozen_string_literal: true

module Display
  def select_game_type_display
    puts "Would you like to start a new game, or load a saved game? \n
        1 - Start Game    2 - Load Game"
  end

  def player_turn
    'Choose a letter.'
  end

  def bad_input
    'Guesses must be a letter you have not yet tried. Guess again.'
  end

  def repeated_guess
    'You already guessed that letter.'
  end

  def display_guesses(title, array)
    puts "#{title}: #{array.join(' ')}"
  end

  def won_game_answer
    <<~HEREDOC

      CONGRATULATIONS! You win!#{' '}

      The winning word was #{@solution.join('')}

      You got the answer with only #{bad_guesses.length} incorrect guesses.

    HEREDOC
  end

  def lost_game_answer
    <<~HEREDOC

      Too bad. Better luck next time.

      The winnig word was #{@solution.join('')}

    HEREDOC
  end

  def play_again
    <<~HEREDOC

    Would you like to play again?

    1 - Yes   2 - No

    HEREDOC
  end
end
