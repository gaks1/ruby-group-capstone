require_relative 'book_app'

class Main
  def initialize
    @book_app = BookApp.new
    @music_app = MusicApp.new
  end

  def display_menu
    puts 'Options:'
    puts '1. Create new book'
    puts '2. Create new music album'
    puts '3. Create new movie'
    puts '4. Create new game'
    puts '5. List all books'
    puts '6. List all music albums'
    puts '7. List all movies'
    puts '8. List of games'
    puts '9. List all genres'
    puts '10. List all labels'
    puts '11. List all authors'
    puts '12. List all sources '
    puts '13. Quit'
  end

  def main(options)
    loop do
      display_menu
      print 'Choose an option: '
      option = gets.chomp.to_i

      if options.key?(option)
        @book_app.send(options[option])
      else
        puts 'Invalid option. Please try again.'
      end

      puts '---------------------'
    end
  end
end

options = {
  1 => :create_book,
  2 => :create_music_album,
  3 => :create_movie,
  4 => :create_game,
  5 => :list_books,
  6 => :list_music_albums,
  7 => :list_movies,
  8 => :list_games,
  9 => :list_genres,
  10 => :list_labels,
  11 => :list_authors,
  12 => :list_sources,
  13 => :save_session_and_exit
}

main = Main.new
main.main(options)
