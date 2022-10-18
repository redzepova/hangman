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
    correct_guess_display
  end

  def player_input(prompt, regex)
    puts prompt
    input = gets.chomp.downcase

    until input.match?(regex) do 
        puts bad_input
        input = gets.chomp.downcase
    end

    return input
  end

  def correct_guess_display
    @solution.each do 
        @correct_guesses << "_"
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
  end 

  def play
    until @correct_guesses == @solution || @bad_guesses.length == 3
        display_guesses("SECRET WORD", @correct_guesses)
        display_guesses("INCORRECT GUESSES", @bad_guesses)

        @guess = player_input(player_turn, /[a-z]|[save]/)
        compare_to_solution if @guess.length == 1
    end
  end
end
