require 'json'
require_relative 'item'
require_relative 'game'
require_relative 'author'

class DataSaver
  def self.save_games(games)
    new_games = games.each_with_index.map do |game, index|
      {
        id: index + 1,
        publish_date: game.publish_date,
        last_played_at: game.last_played_at,
        multiplayer: game.multiplayer
      }
    end
    json_games = JSON.generate(new_games)
    File.write('./storage/games.json', json_games)
  end

  def self.save_authors(authors)
    new_authors = authors.each_with_index.map do |author, index|
      {
        id: index + 1,
        first_name: author.first_name,
        last_name: author.last_name
      }
    end
    json_authors = JSON.generate(new_authors)
    File.write('./storage/authors.json', json_authors)
  end
end
