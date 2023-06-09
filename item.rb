require 'date'

class Item
  attr_accessor :id, :publish_date, :archived
  attr_reader :author, :genre, :source, :label

  def initialize(publish_date)
    @id = rand(1..9999)
    @publish_date = publish_date
    @archived = false
  end

  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def source=(source)
    @source = source
    source.items << self unless source.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def can_be_archived?
    Time.now.year - @publish_date.year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
  end
  private :can_be_archived?
end
