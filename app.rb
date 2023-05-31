require './author'
require './game'
require './retrieve_data'

class App
  attr_accessor :genres, :sources, :labels, :authors, :books, :movies,
                :music_albums, :games

  def initialize
    self.genres = []
    self.sources = []
    self.labels = []
    self.authors = []
    self.books = []
    self.movies = []
    self.music_albums = []
    self.games = []
    @exit = false
  end

  def add_game
    print 'Enter the game name: '
    name = gets.chomp

    print 'Enter the platform: '
    platform = gets.chomp

    print 'Enter the last date played (YYYY-MM-DD): '
    last_played_date_input = gets.chomp

    begin
      last_played_at = Date.parse(last_played_date_input.to_s)
    rescue ArgumentError, TypeError
      puts 'Invalid date format. Please use the format YYYY-MM-DD.'
      return
    end

    game = Game.new(name, platform, last_played_at)
    games << game

    puts 'Game added successfully.'
  end

  def list_games
    puts 'No games added yet!' if games.empty?
    games.each_with_index do |game, index|
      puts "#{index + 1} Name: #{game.name} Platform: #{game.platform} Last Played: #{game.last_played_at}"
    end
  end

  def display_options
    options = %w[
      add_game list_games exit
    ]

    options.each_with_index do |option, index|
      puts "#{index + 1}: #{option}"
    end
  end

  def leave
    @exit = true
  end

  def execute(choice)
    return add_game if choice == 1
    return list_games if choice == 2
    return leave if choice == 3

    puts 'Invalid choice'
  end

  def final
    retrieve_data(self)
    while @exit == false
      display_options
      execute(gets.chomp.to_i)
    end
    save_data(self)
  end
end
