require 'json'
require_relative 'game'
require_relative 'author'

class DataLoader
  def self.load_games
    games_data = JSON.parse(File.read('./data/games.json'), symbolize_names: true)
    games_data.map do |game_data|
      Game.new(
        game_data[:publish_date],
        game_data[:last_played_at],
        game_data[:multiplayer]
      )
    end
  end

  def self.load_authors
    authors_data = JSON.parse(File.read('./data/authors.json'), symbolize_names: true)
    authors_data.map do |author_data|
      Author.new(
        first_name: author_data[:first_name],
        last_name: author_data[:last_name]
      )
    end
  end
end
