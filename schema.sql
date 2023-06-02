CREATE TABLE items (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  genre_id INTEGER,
  author_id INTEGER,
  source_id INTEGER,
  label_id INTEGER,
  publish_date DATE,
  archived boolean,
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (source_id) REFERENCES sources(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);




CREATE TABLE music_albums (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  on_spotify BOOLEAN,
  publish_date DATE,
  archived boolean
);

CREATE TABLE genres (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT
  items VARCHAR(255) NOT NULL
);
