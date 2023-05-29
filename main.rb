require_relative 'item'

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

def create_book
  puts 'creating a book'
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

def list_books
  puts 'listing all books'
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

def list_labels
  puts 'listing all labels'
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
    create_book
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

loop do
  display_menu
  print 'Choose an option: '
  option = gets.chomp.to_i

  case option
  when 1
    create_item
  when 2
    list_books
  when 3
    list_music_albums
  when 4
    list_movies
  when 5
    list_games
  when 6
    list_genres
  when 7
    list_labels
  when 8
    list_authors
  when 9
    list_sources
  when 10
    break
  else
    puts 'Invalid option. Please try again.'
  end

  puts '---------------------'
end
