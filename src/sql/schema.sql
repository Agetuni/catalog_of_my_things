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


