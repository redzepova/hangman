class Game
    require_relative "display.rb"
    require_relative "database.rb"
    require 'json'

    include Display

    attr_accessor :all_guesses, :correct_guesses, :solution, :turns, :score, :dictionary


    def initialize ()
        new_game()
        @game_data = Database.new
        @solution = @game_data.random_word.split(//)
        puts "#{@solution}"
    end

    def select_game_type()
        select_game_type_display()  
    end

    def new_game()
        @correct_guesses = []
        @all_guesses = []
        @solution = []
        @turns = 10
    end

    def save_game()
        #pull up info saved as JSON
        #Correct guesses, all guesses, the solution, and number of turns
    end

    def make_guess()
        guess = gets.chomp
        @all_guesses << guess
    end

    def play_round()
        do until @correct_guesses == @solution or @turns == 0
            game_instructions(round)
            make_guess()
            #add guess to guess array
            #compare guess to solution
            #minus 1 from turns
        end
    end
end
