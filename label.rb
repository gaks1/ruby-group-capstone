class Label
  attr_accessor :id, :title, :color, :items

  def initialize(title, color)
    @id = rand(1..9999)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    item.label = self unless @items.include?(item)
    @items << item unless @items.include?(item)
  end
end
