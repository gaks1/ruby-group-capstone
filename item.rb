require 'date'

class Item
  attr_reader :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(publish_date)
    @id = rand(1..9999)
    @publish_date = parse_date(publish_date)
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

  def parse_date(date_str)
    Date.parse(date_str)
  rescue ArgumentError, TypeError
    raise ArgumentError, 'Invalid publish date format'
  end
  private :can_be_archived?, :parse_date
end
