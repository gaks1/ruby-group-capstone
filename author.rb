require './item'

class Author < Item
  attr_accessor :id, :name, :items

  def initialize(name)
    super()
    @id = rand(1...9999)
    @name = name
    @items = []
  end

  def add_item(_item)
    @items << items
    items.author = self
  end
end
