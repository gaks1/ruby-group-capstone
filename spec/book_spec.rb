require_relative '../book'
require 'date'

describe Book do
  before :each do
    @book = Book.new('good', 'publisher', Date.parse('2020-10-10'))
  end

  describe '#new' do
    it 'takes three patameters and returns a Book object' do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe '#cover_state' do
    it 'returns the correct cover_status of the book' do
      expect(@book.cover_state).to eql 'good'
    end
  end

  describe '#publisher' do
    it 'returns the correct publisher of the book' do
      expect(@book.publisher).to eql 'publisher'
    end
  end

  describe '#publish_date' do
    it 'returns the correct publish_date of the book' do
      expect(@book.publish_date).to eql Date.parse('2020-10-10')
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if the book is archived' do
      expect(@book.can_be_archived?).to eql false
    end
    it 'returns true if the book is archived' do
      @book.cover_state = 'bad'
      expect(@book.can_be_archived?).to eql true
    end
  end
end
