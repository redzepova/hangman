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

end
