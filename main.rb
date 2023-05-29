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
