require_relative 'item'
require_relative 'label'
require_relative 'book'
require_relative 'book_data_saver'
require_relative 'book_data_loader'

class BookApp
  def initialize
    @labels = DataLoader.read_labels
    @books = DataLoader.read_books(@labels)
  end

  def create_book
    title = ask_user('Add a label title')
    color = ask_user('Add a color for the label')
    label = Label.new(title, color)
    @labels << label
    puts 'label created successfully'

    cover_state = ask_cover_state('Add the cover state for the book (1) good (2) bad')
    publisher = ask_user('Add the publisher for the book')
    publish_date = ask_publish_date('Add the publish date for the book. Please use the format YYYY-MM-DD.')
    book = Book.new(cover_state, publisher, publish_date)
    book.label = label
    @books << book
    puts 'book added successfully'
  end

  def ask_user(prompt)
    puts prompt
    gets.chomp
  end

  def ask_cover_state(prompt)
    puts prompt
    cover_state = gets.chomp.to_i
    if [1, 2].include?(cover_state)
      cover_state == 1 ? 'good' : 'bad'
    else
      puts 'Invalid cover state.'
      ask_cover_state(prompt)
    end
  end

  require 'date'

  def ask_publish_date(prompt)
    puts prompt
    publish_date = gets.chomp
    begin
      Date.parse(publish_date)
    rescue ArgumentError
      puts 'Invalid date format. Please use the format YYYY-MM-DD.'
      ask_publish_date(prompt)
    end
  end

  def list_books
    puts 'listing all books'
    @books.each do |book|
      puts "Id: #{book.id} Publisher: #{book.publisher} Publish date: #{book.publish_date} Label: #{book.label.title}"
    end
  end

  def book_save
    DataSaver.save_book(@books)
    DataSaver.save_labels(@labels)
  end

  def list_labels
    puts 'listing all labels'
    @labels.each do |label|
      puts "Title: #{label.title} Color: #{label.color}"
    end
  end

  def create_movie
    puts 'No movie can be created now. Apologies'
  end

  def create_game
    puts 'create game'
  end

  def list_movies
    puts 'No movie can be listed now. Apologies'
  end

  def list_games
    puts 'listing all games'
  end

  def list_authors
    puts 'listing all authors'
  end

  def list_sources
    puts 'No sources can be listed now. Apologies'
  end
end
