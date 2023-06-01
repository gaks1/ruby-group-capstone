require 'json'

def retrieve_data(app)
  retrieve_games(app)
end

def retrieve_games(app)
  games_data = File.read('./storage_game_author/games.json')
  games_json = JSON.parse(games_data)

  games_json.each do |game_data|
    game = Game.new(game_data['name'], game_data['platform'], Date.parse(game_data['last_played_at']))
    app.games << game
  end
end
