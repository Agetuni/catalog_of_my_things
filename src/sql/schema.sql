CREATE TABLE Movie (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    silent BOOLEAN,
    publish_date DATE
    archived BOOLEAN,
    source_id INTEGER REFERENCES source (id)  
);


CREATE TABLE game (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    multiplayer BOOLEAN,
    last_played_at DATE,
    publish_date DATE,
    archived BOOLEAN,
    author_id INTEGER REFERENCES author (id)  
);



CREATE TABLE author (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR
);


CREATE TABLE source (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR,
);

CREATE TABLE book(
  ID SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  publisher VARCHAR(30) NOT NULL,
  cover_state VARCHAR(10) NOT NULL,
  label_ID INT,
  author_ID INT,
  genre_ID INT,
  FOREIGN KEY (label_ID) REFERENCES label(ID),
  FOREIGN KEY (author_ID) REFERENCES author(ID),
  FOREIGN KEY(genre_ID) REFERENCES genre(ID)
);

CREATE TABLE label(
  ID SERIAL PRIMARY KEY,
  name VARCHAR(30)
);

CREATE TABLE genres (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(150) NOT NULL
)

CREATE TABLE music_albums(
  id BIGSERIAL PRIMARY KEY,
  type_of_item text
  label_id INTEGER,
  genre_id INTEGER,
  author_id INTEGER,
  source_id INTEGER,
  publish_date DATE,
  archived BOOLEAN,
  ON_SPOTIFY BOOLEAN,
  FOREIGN KEY (label_id) REFERENCES labels(id),
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (source_id) REFERENCES sources(id)
);
