require 'json'

def save_album(album)
  JSON.dump(album, File.open('./storage/albums.json', 'w+'))
end

def save_genre(genre)
  JSON.dump(genre, File.open('./storage/genre.json', 'w+'))
end

def save_data(item)
  save_album(item.music_albums)
  save_genre(item.genres)
end
