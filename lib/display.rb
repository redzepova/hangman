# frozen_string_literal: true

module Display
  def game_overview
    <<~HEREDOC

    \e[1;93mWelcome to Hangman!

    \e[0;37mThe computer will randomly select a letter between 5-12 letters long, and your mission is to guess that word. You are
    allowed to miss up to 10 guesses.

    HEREDOC
  end
  def select_game_type_display
    <<~HEREDOC


      Would you like to start a new game, or load a saved game?
      #{'   '}
      1 - Start Game    2 - Load Game

    HEREDOC
  end

  def player_turn
    <<~HEREDOC

      Guess a letter. You can also type 'save' to save your game, or 'exit' to exit. If you think you know
      the secret word, type 'solve' to solve. This will use up all your remaining chances.

    HEREDOC
  end

  def bad_input
    'Input error. Try again.'
  end

  def solve_message
    <<~HEREDOC

    Type your best guess. \e[1;31mThis will use all your remaining chances\e[0;37m - so think carefully!

    HEREDOC
  end

  def repeated_guess
    'You already guessed that letter.'
  end

  def display_guesses(title, array)
    <<~HEREDOC

    \e[1;93m#{title}:\e[0;37m  #{array.join(' ')}
    HEREDOC
  end

  def won_game_answer
    <<~HEREDOC

    \e[1;93mCONGRATULATIONS! You win!

    \e[0;37mThe winning word was \e[4;36m#{@solution.join('')}

    \e[0;37mYou got the answer with only \e[4;36m#{bad_guesses.length} incorrect guesses.\e[0;37m

    HEREDOC
  end

  def display_filenames(num, name)
    <<~HEREDOC

      ##{num} ---  #{name}#{'   '}

    HEREDOC
  end

  def lost_game_answer
    <<~HEREDOC

      You lost. Better luck next time.

      The winning word was \e[4;36m#{@solution.join('')}\e[0;37m

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

  def game_difficulty_choices
    <<~HEREDOC

    Select your difficulty level:

    1 - Easy. Words are between 5-8 letters. You can miss 5 letters.
    2 - Medium. Words are between 7-9 letters. You can miss 5 letters.
    3 - Hard. Words are between 8-11 letters. You can miss 5 letters.
    4 - Very hard. Words are between 10-12 letters. You can miss 4 letters.
    5 - RSTLNE. Words are between 8-12 letters. You cannot use RSTLNE for any single letter guesses.
    6 - Wierd. Words are 8-12 letters long. The computer forces you to guess after 6 turns.

    HEREDOC
  end
  def thankyou
    <<~HEREDOC

      Thanks for playing Hangman!

    HEREDOC
  end
end
