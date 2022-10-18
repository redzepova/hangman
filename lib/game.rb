# frozen_string_literal: true

class Game
  require_relative 'display'
  require_relative 'database'
  require 'json'

  include Display
  include Database

  attr_accessor :all_guesses, :correct_guesses, :solution, :turns, :score, :dictionary

  def initialize
    new_game
    @solution = choose_word
  end

  def select_game_type
    select_game_type_display
  end

  def new_game
    @correct_guesses = []
    @bad_guesses = []
    @solution = []
    @turns = 3
  end

  def save_game
    # pull up info saved as JSON
    # Correct guesses, all guesses, the solution, and number of turns
  end

  def make_guess(data)
    guess = gets.chomp
    valid_guess = data.validate_response('alphabet', guess)
    while valid_guess == false
      puts game_instructions('round')
      guess = gets.chomp
      valid_guess = data.validate_response('alphabet', guess)
    end
    guess
  end

  def player_input(prompt, regex)
    puts prompt
    input = gets.chomp
    if input.match?(regex) ? return? print bad_input
  end


  def play
    until @correct_guesses == @solution.split("") || @bad_guesses.length == 3
      puts game_instructions('round')
      guess = make_guess
      # add guess to guess array
      # compare guess to solution
      # minus 1 from turns
    end
  end
end
