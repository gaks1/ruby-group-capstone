require 'json'

def retrieve_albums
  data = JSON.parse(File.read('./storage/albums.json'))
  music_albums = []
  data.each do |album|
    music_albums << MusicAlbum.new(album['on_spotify'], Date.parse(album['publish_date']))
  end
  music_albums
end

def retrieve_genres
  data = JSON.parse(File.read('./storage/genre.json'))
  genres = []
  data.each do |genre|
    genres << Genre.new(genre['name'])
  end
  genres
end

def retrieve_data(item)
  retrieve_albums(item.music_albums)
  retrieve_genres(item.genres)
end
