require './music_album'
require './genre'
require './data'
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

  def add_music_album
    print 'Declare if on Spotify or not [Y/n]: '
    spotify_choice = gets.chomp
    on_spotify = %w[Y y].include?(spotify_choice)

    print 'Enter the date the album was published (YYYY-MM-DD): '
    publish_date_input = gets.chomp

    begin
      publish_date = Date.parse(publish_date_input.to_s)
    rescue ArgumentError, TypeError
      puts 'Invalid publish date format. Please use the format YYYY-MM-DD.'
      return
    end

    print 'What is the source of the album: '
    source = gets.chomp

    print 'What is the label title the album is under: '
    label_title = gets.chomp

    # print 'Label studio: '
    # studio = gets.chomp

    print 'Select the genre of the album: '
    genre = gets.chomp

    puts "Music album created successfully.\n\n"

    music_albums << MusicAlbum.new(on_spotify, publish_date)
    # sources << Source.new(source)
    # labels << Label.new(label_title, studio)
    genres << Genre.new(genre)
  end

  def list_albums
    puts 'No albums uploaded yet!' if @music_albums.empty?
    @music_albums.each_with_index do |album, ind|
      puts "#{ind + 1} On Spotify: #{album.on_spotify} Publish Date: #{album.publish_date}"
    end
  end

  def list_genres
    puts 'No genres added yet!' if @genres.empty?
    @genres.each_with_index do |genre, ind|
      puts "#{ind + 1} Id: #{genre.id} Name: #{genre.name}"
    end
  end

  def display_options
    options = %w[
      add_album list_albums list_genres
      exit
    ]

    options.each_with_index do |option, ind|
      puts "#{ind + 1}: #{option}"
    end
  end

  def leave
    @exit = true
  end

  def execute(choice)
    return add_music_album if choice == 1
    return list_albums if choice == 2
    return list_genres if choice == 3
    return leave if choice == 4

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

