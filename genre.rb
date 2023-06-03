require './item'

class Genre
  attr_accessor :id, :name, :items

  def initialize(name)
    @id = rand(1..9999)
    @name = name
    @items = []
  end

  def to_json(*_args)
    "{
      \"id\": \"#{id}\",
      \"name\": \"#{name}\"
    }"
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
