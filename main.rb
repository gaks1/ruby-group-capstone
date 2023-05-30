require_relative 'appp'

def display_menu
  puts 'Options:'
  puts '1. Create new item'
  puts '2. List all books'
  puts '3. List all music albums'
  puts '4. List all movies'
  puts '5. List of games'
  puts '6. List all genres'
  puts '7. List all labels'
  puts '8. List all authors'
  puts '9. List all sources '
  puts '10. Quit'
end

def create_music_album
  puts 'creating a music album'
end

def create_movie
  puts 'creating a movie'
end

def create_game
  puts 'creating a game'
end

def list_music_albums
  puts 'listing all music albums'
end

def list_movies
  puts 'listing all movies'
end

def list_games
  puts 'listing all games'
end

def list_genres
  puts 'listing all genres'
end

def list_authors
  puts 'listing all authors'
end

def list_sources
  puts 'listing all sources'
end

def create_item
  puts 'Enter (1) for Book (2) for MusicAlbum (3) for Game :'
  num = gets.chomp.to_i
  case num
  when 1
    @app.create_book
  when 2
    create_music_album
  when 3
    create_game
  when 4
    create_movie
  else
    puts 'Error'
  end
end

options = {
  1 => :create_item,
  2 => :list_books,
  3 => :list_music_albums,
  4 => :list_movies,
  5 => :list_games,
  6 => :list_genres,
  7 => :list_labels,
  8 => :list_authors,
  9 => :list_sources,
  10 => :save_session_and_exit
}

def main(options)
  @app = App.new

  loop do
    display_menu
    print 'Choose an option: '
    option = gets.chomp.to_i

    if options.key?(option)
      send(options[option])
    else
      puts 'Invalid option. Please try again.'
    end

    puts '---------------------'
  end
end
main(options)
