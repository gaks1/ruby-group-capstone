require_relative '../game'
require_relative '../author'
require 'rspec'

describe Game do
  let(:publish_date) { Date.new(2002, 1, 30) }
  let(:last_played_at) { Date.new(2000, 1, 1) }
  let(:multiplayer) { true }
  let(:authors) { [] }

  subject { described_class.new(publish_date, last_played_at, multiplayer) }

  describe '#initialize' do
    it 'adds authors to the game' do
      author = Author.new(first_name: 'Test', last_name: 'Author')
      subject.add_author(author)
      expect(subject.authors).to eq([author])
      expect(author.items).to eq([subject])
    end

    it 'sets the multiplayer' do
      expect(subject.multiplayer).to eq(multiplayer)
    end

    it 'sets the last played at time' do
      expect(subject.last_played_at).to eq(last_played_at)
    end

    it 'sets the publish date' do
      expect(subject.publish_date).to eq(publish_date)
    end

    it 'sets the ID to a random number between 1 and 1000' do
      expect(subject.id).to be_between(1, 1000)
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if the item is older than 2 years' do
      subject.instance_variable_set(:@last_played_at, Date.new(2020, 3, 30))
      expect(subject.send(:can_be_archived?)).to eq(true)
    end

    it 'returns false if the item is not older than 2 years' do
      subject.instance_variable_set(:@last_played_at, Date.new(2022, 5, 15))
      expect(subject.send(:can_be_archived?)).to eq(false)
    end
  end

  describe '#to_hash' do
    it 'includes author IDs' do
      author = Author.new(first_name: 'Test', last_name: 'Author')
      subject.add_author(author)
      expected_hash = {
        id: subject.id,
        publish_date: publish_date,
        last_played_at: last_played_at,
        multiplayer: multiplayer,
        author_ids: [author.id]
      }
      expect(subject.to_hash).to eq(expected_hash)
    end
  end
end
