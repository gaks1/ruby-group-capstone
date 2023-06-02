class DataLoader
  @games = []
  @authors = []

  def self.load_data
    return unless File.exist?('./data/games.json') && File.exist?('./data/authors.json')

    games_data = JSON.parse(File.read('./data/games.json'), object_class: Game)
    authors_data = JSON.parse(File.read('./data/authors.json'), object_class: Author)
    @games = games_data.map do |game_data|
      Game.new(game_data['publish_date'], game_data['last_played_at'], game_data['multiplayer'], [])
    end
    @authors = authors_data
  end

  class << self
    attr_reader :games
  end

  class << self
    attr_reader :authors
  end
end
