require 'json'
require_relative 'book'
require_relative 'label'
require_relative 'item'

class DataLoader
  # load data from books json file
  def self.read_labels
    return [] unless File.exist?('labels.json')

    file = File.open('labels.json')
    new_labels = File.read(file)
    json_labels = JSON.parse(new_labels)
    load_labels = []
    json_labels.each do |label|
      new_label = Label.new(label['title'], label['color'])
      load_labels << new_label
    end
    file.close
    load_labels
  end

  def self.read_books(labels)
    return [] unless File.exist?('books.json')

    file = File.open('books.json')
    new_books = File.read(file)
    json_books = JSON.parse(new_books)
    load_books = []
    json_books.each do |book|
      new_book = Book.new(book['cover_state'], book['publisher'], Date.parse(book['publish_date']).to_s)
      new_book.id = book['id']
      new_book.archived = book['archived']
      new_book.label = labels[book['index']]
      load_books << new_book
    end
    file.close
    load_books
  end
end
