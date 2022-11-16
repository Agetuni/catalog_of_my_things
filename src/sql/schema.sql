CREATE TABLE book (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    publisher VARCHAR(100),
    publish_date DATE,
    cover_state BOOLEAN,
    archived BOOLEAN,
    label_id INTEGER REFERENCES label (id)
);


CREATE TABLE music_album (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    on_spotify BOOLEAN,
    publish_date DATE
    archived BOOLEAN,
    genre_id INTEGER REFERENCES genre (id)  
);


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


CREATE TABLE label (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    title VARCHAR,
    color VARCHAR
);

CREATE TABLE author (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR
);

CREATE TABLE gerne (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR,
);

CREATE TABLE source (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR,
);


