# frozen_string_literal: true

class Game
  require_relative 'display'
  require_relative 'database'
  require 'json'

  include Display
  include Database

  attr_accessor :bad_guesses, :correct_guesses, :solution, :guess, :@difficulty

  def initialize
    puts game_overview
    select_game_type
    play
    play_again?
  end

  def select_game_type
    choice = player_input(select_game_type_display, /[12]/)
    choice == '1' ? new_game : load_game
  end

  def new_game
    @bad_guesses = []
    @solution = choose_word.split(//)
    @correct_guesses = []
    @all_guesses = []
    @save_game = ""
    correct_guess_display
  end

  def select_game_difficulty
    #prompt user to select difficulty level. Explain choices.
  end

  def player_input(prompt, regex = /[\w]/)
    puts prompt
    input = gets.chomp.downcase

    until input.match?(regex)
      puts bad_input
      input = gets.chomp.downcase
    end

    input
  end

  def correct_guess_display
    @solution.each do
      @correct_guesses << '_'
    end
  end

  def compare_to_solution
    if @solution.any?(@guess)
      solution.each_with_index do |letter, index|
        @guess == letter ? @correct_guesses[index] = letter : next
      end
    else
      @bad_guesses << @guess
    end

    @all_guesses << @guess
  end

  def won_game
    puts won_game_answer
  end

  def play_again?
    play_game = player_input(play_again, /[12]/)
    play_game == '1' ? Game.new : game_quit
  end

  def game_over
    puts lost_game_answer
  end

  def game_quit
    puts thankyou
    exit
  end

  def save
    save_game(player_input(save_game_name))
    continue = player_input(keep_playing?, /[12]/)
    game_quit if continue == '2'
  end

  def solve
    @guess = player_input(solve_message, /[a-z]/)

    @guess.split('') == @solution ? won_game : game_over

    play_again?
  end

  def play (difficulty)
    until @correct_guesses == @solution || @bad_guesses.length == difficulty
      puts display_guesses('SECRET WORD', @correct_guesses)
      puts display_guesses('INCORRECT GUESSES', @bad_guesses)

      @guess = player_input(player_turn, /[a-z]|[save]|[@correct_guesses]|[exit]|[solve]/)
      save if @guess == 'save'
      solve if @guess == 'solve'
      game_quit if @guess == 'exit'
      compare_to_solution if @guess.length == 1
    end

    @correct_guesses == @solution ? won_game : game_over
  end
end
