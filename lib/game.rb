# frozen_string_literal: true

class Game
  require_relative 'display'
  require_relative 'database'
  require 'json'

  include Display
  include Database

  attr_accessor :bad_guesses, :correct_guesses, :solution, :guess

  def initialize
    new_game
    puts @solution.to_s
    play
  end

  def select_game_type
    select_game_type_display
  end

  def new_game
    @bad_guesses = []
    @solution = choose_word.split(//)
    @correct_guesses = []
    @all_guesses = []
    correct_guess_display
  end

  def player_input(prompt, regex)
    puts prompt
    input = gets.chomp.downcase

    until input.match?(regex) && @all_guesses.any?(input) == false
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
    play_game = player_input(play_again, /[12]/)
    Game.new if play_game == '1'
  end

  def game_over
    puts lost_game_answer
    play_game = player_input(play_again, /[12]/)
    Game.new if play_game == '1'
  end

  def play
    until @correct_guesses == @solution || @bad_guesses.length == 3
      display_guesses('SECRET WORD', @correct_guesses)
      display_guesses('INCORRECT GUESSES', @bad_guesses)

      @guess = player_input(player_turn, /[a-z]|[save]|[@correct_guesses]/)
      compare_to_solution if @guess.length == 1
    end

    @correct_guesses == @solution ? won_game : game_over
  end
end
