require_relative 'book_app'

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
      @app.send(options[option])
    else
      puts 'Invalid option. Please try again.'
    end

    puts '---------------------'
  end
end
main(options)
