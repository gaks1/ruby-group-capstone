require_relative '../label'

describe Label do
  before :each do
    @label = Label.new('title', 'color')
  end

  describe '#initialize' do
    it 'creates a new label' do
      expect(@label).to be_a(Label)
    end
  end

  describe '#title' do
    it 'has a title' do
      expect(@label.title).to eq('title')
    end
  end

  describe '#color' do
    it 'has a color' do
      expect(@label.color).to eq('color')
    end
  end

  describe '#add_item' do
    it 'adds an item to the label' do
      Label.new('Test', 'color')
      publish_date = Date.parse('2010-10-10')
      item = Item.new(publish_date)
      @label.add_item(item)
      expect(@label.items).to include(item)
    end
  end
end
