# frozen_string_literal: true

module Display
  def select_game_type_display
    <<~HEREDOC
      Would you like to start a new game, or load a saved game?
      #{'   '}
      1 - Start Game    2 - Load Game

    HEREDOC
  end

  def player_turn
    <<~HEREDOC

      Guess a letter. You can also type 'save' to save your game.

    HEREDOC
  end

  def bad_input
    'Input error. Try again.'
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

  def display_filenames(num, name)
    <<~HEREDOC

      ##{num} ---  #{name}#{'   '}

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

  def save_game_name
    'What would you like to name your game?'
  end

  def game_saved(name)
    "Your game was saved as #{name}"
  end

  def keep_playing?
    <<~HEREDOC

      Would you like to keep playing?#{' '}

      1 - Yes  2 - No

    HEREDOC
  end

  def which_game?
    'Select a saved game to play.'
  end

  def thankyou
    <<~HEREDOC

      Thanks for playing Hangman!

    HEREDOC
  end
end
