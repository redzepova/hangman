# frozen_string_literal: true

class Database
    attr_accessor :dictionary
    def initialize
        @dictionary = Array.new
        find_valid_words
    end
  def find_valid_words()
    file = File.open('dictionary.txt')
    until file.eof?
      line = file.readline
      @dictionary << line.chomp if line.length > 5 && line.length < 10
    end
  end

  def random_word()
    @dictionary.sample
  end

  def game_info_to_json()
  end

  def validate_response (type, response)
    case type
    when "guess"
      if response =~ /[^a-z]
        


end
