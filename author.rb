require_relative 'item'

class Author
  attr_accessor :first_name, :last_name
  attr_reader :items

  def initialize(first_name:, last_name:)
    @id = rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.author = self
  end

  def to_hash
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name,
      items: @items.map(&:to_hash)
    }
  end
end
