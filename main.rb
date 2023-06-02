require_relative 'book_app'
require_relative 'music_album_app'
require_relative 'book_data_saver'
require_relative 'game_app'

class Main
  def initialize
    @book_app = BookApp.new
    @music_app = MusicApp.new
    @game_app = GameApp.new
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

  def save_session_and_exit
    DataSaver.save_book(@books)
    DataSaver.save_labels(@labels)
    @book_app.book_save
    @music_app.music_save
    @game_app.save_session_and_exit
    puts 'saving'
  end

  def main(options)
    loop do
      display_menu
      print 'Choose an option: '
      option = gets.chomp.to_i

      if option == 13
        puts 'saving session'
        save_session_and_exit
        puts 'exiting...'
        exit
      elsif [1, 3, 5, 7, 10, 12].include?(option)
        @book_app.send(options[option.to_i])
      elsif [4 ,8 , 11].include?(option)
        @game_app.send(options[option])
      elsif [2, 6, 9].include?(option)
        @music_app.send(options[option])
      else
        puts 'Invalid option'
      end

      puts '---------------------'
    end
  end
end

options = {
  1 => :create_book,
  2 => :add_music_album,
  3 => :create_movie,
  4 => :create_game,
  5 => :list_books,
  6 => :list_albums,
  7 => :list_movies,
  8 => :list_games,
  9 => :list_genres,
  10 => :list_labels,
  11 => :list_authors,
  12 => :list_sources
}

main = Main.new
main.main(options)
