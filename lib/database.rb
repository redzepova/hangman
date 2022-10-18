# frozen_string_literal: true
module Database
  require_relative "display.rb"

  include Display

  def find_valid_words
    arr = Array.new
    file = File.open('dictionary.txt')
    until file.eof?
      line = file.readline
      arr << line.chomp if line.length > 5 && line.length < 10
    end
    arr
  end

  def choose_word
    words = find_valid_words
    words.sample
  end

  def game_info_to_json
  end
