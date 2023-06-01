require 'json'
require_relative 'book'
require_relative 'label'
require_relative 'item'

class DataSaver
  # save data into files
  def self.save_book(books)
    new_books = books.each_with_index.map do |book, index|
      {
        id: book.id,
        publisher: book.publisher,
        publish_date: book.publish_date,
        cover_state: book.cover_state,
        archived: book.archived,
        label: book.label.title,
        index: index
      }
    end
    json_books = JSON.generate(new_books)
    File.write('./books.json', json_books)
  end

  def self.save_labels(labels)
    new_labels = labels.each_with_index.map do |label, index|
      { title: label.title, color: label.color, index: index }
    end
    json_labels = JSON.generate(new_labels)
    File.write('./labels.json', json_labels)
  end
end
