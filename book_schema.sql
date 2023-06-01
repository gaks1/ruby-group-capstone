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
