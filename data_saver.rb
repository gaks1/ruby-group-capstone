class DataSaver
  @games = []
  @authors = []

  def self.save_data
    data = {
      games: @games.map(&:to_hash),
      authors: @authors.map(&:to_hash)
    }

    File.write('./data/games.json', JSON.generate(data[:games]))
    File.write('./data/authors.json', JSON.generate(data[:authors]))
  end

  class << self
    attr_writer :games, :authors
  end
end
