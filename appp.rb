require_relative 'item'
require_relative 'label'
require_relative 'book'
require_relative 'dataa_saver'
require_relative 'dataa_loader'

class App
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

    cover_state = ask_user('Add the cover state for the book (1) good (2) bad').to_i == 1 ? 'good' : 'bad'
    publisher = ask_user('Add the publisher for the book')
    publish_date = ask_user('Add the publish date for the book')

    book = Book.new(cover_state, publisher, publish_date)
    book.label = label
    @books << book
    puts 'book added successfully'
  end

  def ask_user(prompt)
    puts prompt
    gets.chomp
  end

  def list_books
    puts 'listing all books'
    @books.each do |book|
      puts "Id: #{book.id} Publisher: #{book.publisher} Publish date: #{book.publish_date} Label: #{book.label.title}"
    end
  end

  def save_session
    puts 'saving session'
    DataSaver.save_book(@books)
    DataSaver.save_labels(@labels)
  end

  def list_labels
    puts 'listing all labels'
    @labels.each do |label|
      puts "Title: #{label.title} Color: #{label.color}"
    end
  end
end
