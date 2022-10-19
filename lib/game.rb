# frozen_string_literal: true

class Game
  require_relative 'display'
  require_relative 'database'
  require 'json'

  include Display
  include Database

  attr_accessor :bad_guesses, :correct_guesses, :solution, :guess

  def initialize
    select_game_type
    play
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
    @save_game = ''
    correct_guess_display
  end

  def player_input(prompt, regex = /\w/)
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

    File.delete("output/#{@saved_game}") if File.exist?("output/#{@saved_game}")
    exit
  end

  def save
    save_game(player_input(save_game_name))
    continue = player_input(keep_playing?, /[12]/)
    game_quit if continue == '2'
  end

  def play
    until @correct_guesses == @solution || @bad_guesses.length == 10
      display_guesses('SECRET WORD', @correct_guesses)
      display_guesses('INCORRECT GUESSES', @bad_guesses)

      @guess = player_input(player_turn, /[a-z]|[save]|[@correct_guesses]|[exit]/)
      save if @guess == 'save'
      game_quit if @guess == 'exit'
      compare_to_solution if @guess.length == 1
    end

    @correct_guesses == @solution ? won_game : game_over
  end
end
