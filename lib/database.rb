# frozen_string_literal: true

module Database
  require_relative 'display'
  require 'json'

  include Display

  def find_valid_words(min, max, optional = /\w+/)
    arr = []
    file = File.open('dictionary.txt')
    until file.eof?
      line = file.readline
      arr << line.chomp if line.length > min && line.length < max && line.match?(optional)
    end
    arr
  end

  def choose_word
    words = find_valid_words
    words.sample
  end

  def to_json(*_args)
    JSON.dump(
      'solution' => @solution,
      'correct_guesses' => @correct_guesses,
      'bad_guesses' => @bad_guesses,
      'all_guesses' => @all_guesses,
      'difficulty' => @difficulty
    )
  end

  def save_game(name)
    Dir.mkdir 'output' unless Dir.exist? 'output'
    filename = "#{name}.json"
    File.open("output/#{filename}", 'w') { |file| file.write to_json }
    puts game_saved(filename)
  end

  def find_saved_file
    files = file_list
    display_filenames('File #', 'Name')
    files.each_with_index do |file, index|
      puts display_filenames((index + 1).to_s, file.to_s)
    end
    selection = user_chooses_game
    @saved_game = (files[selection.to_i - 1]).to_s
  end

  def file_list
    files = []
    Dir.entries('output').each do |name|
      files << name if name.match?(/[json]/)
    end
    puts "files: #{files}"
    files
  end

  def user_chooses_game
    game = player_input(which_game?, /\d+|[exit]/)
  end

  def load_file
    file = JSON.parse(File.read("output/#{@saved_game}"))
    @solution = file['solution']
    @correct_guesses = file['correct_guesses']
    @bad_guesses = file['bad_guesses']
    @all_guesses = file['all_guesses']
    @difficulty = file['difficulty']
  end

  def load_game
    find_saved_file
    load_file
    puts "The file loaded is #{@saved_game}"
    play
    File.delete("output/#{@saved_game}") if File.exist?("output/#{@saved_game}")
    play_again?
  end
end
