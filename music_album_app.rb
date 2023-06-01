require './music_album'
require './genre'
require './music_album_data'
require './retrieve_data'

class MusicApp
  attr_accessor :genres, :sources, :labels, :authors, :books, :movies,
                :music_albums, :games

  def initialize
    self.genres = retrieve_genres
    self.sources = []
    self.labels = []
    self.authors = []
    self.books = []
    self.movies = []
    self.music_albums = retrieve_albums
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

    print 'Select the genre of the album: '
    genre = gets.chomp

    puts "Music album created successfully.\n\n"

    music_albums << MusicAlbum.new(on_spotify, publish_date)
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

  def music_save
    save_data(self)
  end

  # def final
  #   retrieve_data(self)
  #   while @exit == false
  #     display_options
  #     execute(gets.chomp.to_i)
  #   end
  #   save_data(self)
  # end
end
