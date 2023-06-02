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

CREATE TABLE IF NOT EXISTS books (
    id INT PRIMARY KEY,
    title TEXT NOT NULL,
    cover_state TEXT NOT NULL,
    publisher TEXT NOT NULL,
    publish_date DATE NOT NULL,
    label_id INT,
    FOREIGN KEY (label_id) REFERENCES labels(id)
);

CREATE TABLE IF NOT EXISTS labels (
    id INT PRIMARY KEY,
    title TEXT NOT NULL,
    color TEXT NOT NULL
);

--------------- Create game table ------------------

CREATE TABLE game (
    id SERIAL PRIMARY KEY,
    publish_date DATE,
    last_played_at TIMESTAMP,
    multiplayer BOOLEAN,
    genre_id VARCHAR(255) INT,
    label_id VARCHAR(255) INT,
    author_id INTEGER,
    CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
    CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES labels(label_id)
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors(author_id)
    PRIMARY KEY (id)
);

-------------- Create author table -------------------
CREATE TABLE author (
  id SERIAL PRIMARY KEY,
  first_name  VARCHAR(100),
  last_name   VARCHAR(100)
);