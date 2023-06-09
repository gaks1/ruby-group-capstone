require 'date'
require_relative '../author'
require 'rspec'

describe Author do
  let(:author) { Author.new(first_name: 'Salwa', last_name: 'Ballouti') }
  let(:game) { double('game') }

  describe '#initialize' do
    it 'should set the first name' do
      expect(author.first_name).to eq('Salwa')
    end

    it 'should set the last name' do
      expect(author.last_name).to eq('Ballouti')
    end

    it 'should set an empty array for items' do
      expect(author.items).to be_empty
    end
  end
end
